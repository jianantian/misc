import requests
import html
import re
from bs4 import BeautifulSoup
from collections import OrderedDict
from pprint import pprint

url = "http://www.eduro.com"
try:
    responce = requests.get(url)
    responce.raise_for_status()
except Exception as e:
    print(e)
    pass
else:
    try:
        page = responce.text.encode("utf8")
        soup = BeautifulSoup(page, "html.parser")
    except Exception as e:
        print(e)
        pass
quote_dict = OrderedDict()
for tag in soup.find_all("div", class_="article"):
    try:
        quote = html.unescape(tag.p.text)
    except TypeError:
        print(tag.p)
    quote = quote.replace('\n', ' ')
    author_tag = tag.find("p", class_="author")
    try:
        author = html.unescape(author_tag.string)
    except TypeError:
        print(author_tag)
    author = re.sub(r"\u2013|\xa0", "", author).strip()
    quote_dict[quote] = author

pprint(quote_dict)


    