import argparse
import json
import re

import requests
from bs4 import BeautifulSoup


def fetch_resource_abbreviations(url):
    response = requests.get(url)
    soup = BeautifulSoup(response.text, 'html.parser')
    content_div = soup.find('div', {'class': 'content'})
    tables = content_div.find_all('table')
    data = {}
    acronyms = 'AI|IP|VM|BI|HD|DB|SQL|CDN|IoT|API|SignalR|WebPubSub|StorSimple|ExpressRoute'
    regex = r'^([A-Z][a-z]*$)|.*(?:{}).*'.format(acronyms)
    for table in tables:
        rows = table.find_all('tr')
        for row in rows[1:]:
            cells = row.find_all('td')
            resource = cells[0].get_text()
            abbreviation = cells[2].get_text()
            # Ignore entries where the abbreviation is enclosed in < and >            
            if not (abbreviation.startswith('<') and abbreviation.endswith('>')):
                # Split the resource string into words
                words = re.split(r'\W+', resource)
                # Convert each word to title case unless it's already in camel case
                words = [word if re.match(regex, word) else word.title() for word in words]
                # Join the words back together and remove any remaining non-alphanumeric characters
                resource = ''.join(words)
                data[resource] = abbreviation
    return data

def main(file_path):
    url = "https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations"
    data = fetch_resource_abbreviations(url)
    with open(file_path, 'w') as f:
        json.dump(data, f, indent=4)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-f', '--file', help='The path to the file where the data will be written', default='abbreviations.json')
    args = parser.parse_args()
    main(args.file)