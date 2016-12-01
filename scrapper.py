import requests
from BeautifulSoup import BeautifulSoup

url = 'https://www.lynda.com/Node-js-tutorials/Node-js-Essential-Training/417077-2.html'
response = requests.get(url)
html = response.content
import pdb; pdb.set_trace()
soup = BeautifulSoup(html)
search_area = soup.find('div', attrs={'id': 'search-results-area'})

for div in search_area.findAll('div', attrs={'class': 'col-xs-10 col-md-10 video-name-cont no-book'}):
	title = div.find('a').text
	print(title)
