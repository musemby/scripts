import requests
from BeautifulSoup import BeautifulSoup

url = 'https://www.lynda.com/Node-js-tutorials/Node-js-Essential-Training/417077-2.html'
response = requests.get(url)
html = response.content

soup = BeautifulSoup(html)
search_area = soup.find('div', attrs={'id': 'toc-content'})
import pdb; pdb.set_trace()
course_toc = search_area.find('ul', attrs={'class': 'course-toc toc-container autoscroll autoscroll-disabled'})
lips = course_toc.findAll('li', attrs={'role': 'presentation'})

for lip in lips:
	toci = lip.find('ul', attrs={'class': 'row toc-items'})
	tocv = toci.findAll('li', attrs={'class': 'class="toc-video-item"'})
	for each in tocv:
		fin = each.find('div', attrs={'class': 'row video-row'}).find('div', {'class': 'col-xs-10 col-md-10 video-name-cont no-book'}).find('a')
		print(fin.text)


for row in table.findAll('tr'):
    for cell in row.findAll('td'):
        print cell.text