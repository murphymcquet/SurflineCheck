import logging
import urllib3
import requests
import re
import json
import datetime
from bs4 import BeautifulSoup
from selenium import webdriver
from urllib.parse import urljoin

logging.basicConfig(
    format='%(asctime)s %(levelname)s:%(message)s',
    level=logging.INFO)

ROOT_URL = 'https://www.surfline.com'
ROOT_CRAWL_PATH = "/surf-reports-forecasts-cams"
RESULTS_FILE = "SurflineScrapeResults"
REGION_URL_REGEX = "\/surf-reports-forecasts-cams\/[a-z,A-Z,\-]+\/[0-9]{7}"
SPOT_URL_REGEX = "\/surf-report\/([a-z-]+)\/([0-9a-z]{24})"

class Crawler:

    def __init__(self):
        self.visited_urls = {}
        self.spots = {}
        
        driver_options = webdriver.ChromeOptions()
        #driver_options.add_argument('headless')
        #driver_options.add_argument('window-size=1200x600')
        self.driver = webdriver.Chrome(options=driver_options)

    def download_url(self, url):
        logging.info("Getting URL: " + url)
        self.driver.get(url)
        #logging.info(self.driver.page_source)
        return self.driver.page_source

    def get_linked_urls(self, html, pattern = None):
        soup = BeautifulSoup(html, 'lxml')
        for link in soup.find_all('a'):
            path = link.get('href')
            if path and path.startswith('/') and path not in self.visited_urls:
                if pattern == None or re.match(pattern, path):
                    # path = urljoin(url, path)
                    yield path

    def add_url_to_visit(self, url):
        self.visited_urls[url] = ""

    def run(self, root_url):
        # Get regions
        for region_url in self.get_linked_urls(self.download_url(root_url), pattern = REGION_URL_REGEX):
            self.add_url_to_visit(region_url)
            logging.info("Processiong REGION url: " + region_url)
            for spot_url in self.get_linked_urls(self.download_url(ROOT_URL + region_url), pattern = SPOT_URL_REGEX):
                self.add_url_to_visit(spot_url)
                match_info = re.match(SPOT_URL_REGEX, spot_url)
                spot_name, spot_id = match_info.group(0), match_info.group(1)
                logging.info("Adding SPOT: " + spot_name)
                self.spots[spot_name] = spot_id

        return self.spots

if __name__ == '__main__':
    root_url = ROOT_URL + ROOT_CRAWL_PATH
    spots = Crawler().run(root_url)
    json_object = json.dumps(spots, indent=4)
    with open(RESULTS_FILE + str(datetime.datetime.now()), "w") as outfile:
        outfile.write(json_object)