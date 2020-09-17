#!/usr/bin/python3
"""
Request the top ten hot posts
"""
import requests


def count_words(subreddit, word_list, after=None, my_dict={}):
    """
    Gets the top ten hot post of a subreddit
    """
    url = 'https://www.reddit.com/r/{}/hot.json'.format(subreddit)
    payload = {'after': after}
    response = requests.get(url,
                            allow_redirects=False,
                            params=payload,
                            headers={'User-Agent': 'Pear'})
    if response and response.status_code == 200:
        after = response.json().get('data').get('after')
        if (after is None):
            sorted_by_name = sorted(my_dict.items())
            sorted_by_value = sorted(sorted_by_name,
                                     key=lambda x: x[1],
                                     reverse=True)
            for element in sorted_by_value:
                if (element[1] != 0):
                    print(element[0], element[1])
            return
        post_list = response.json().get('data').get('children')
        for children in post_list:
            for word in word_list:
                title1 = children.get('data').get('title')
                try:
                    my_dict[word] += title1.lower().split().count(word.lower())
                except KeyError:
                    my_dict[word] = title1.lower().split().count(word.lower())
        return count_words(subreddit, word_list, after, my_dict)
    else:
        return None
