coding='utf-8'
import os
from gensim.models import Word2Vec
import re

class Sentences():
    def __init__(self, path):
        self.path = path

    def __iter__(self):
        file_list = os.listdir(self.path)
        for file_index in file_list:
            a = []
            for line in open(os.path.abspath(os.curdir) + '/dataset/webshell/' + str(file_index), 'rb'):
                line = re.sub(r'[^\x00-\x7F]+',' ', str(line))
                char = ['\t', '\n', '\\t', '\\n', '<?php', '?>', ';', '<html', '</html>', '<body', '</body>', '>',
                        '<head', '</head>', '<meta', '/>', '<title', '</title>', '<style>', '</style>', '<script',
                        '</script>', '<a', '</a>', '<p', '</p>', '<div', '</div>', '<b', '</b>']
                for i in char:
                    line = line.strip(i)
                line = line.split(' ')
                a = a + line
            yield a



#训练词向量模型
path = os.path.abspath(os.curdir) + '/dataset/webshell/'
sentences = Sentences(path)
word_model = Word2Vec(sentences,vector_size=128,window=10,min_count=5)
output = "word_train.model"
word_model.save(output)


