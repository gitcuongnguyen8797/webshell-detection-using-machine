coding='utf-8'
import os
from gensim.models import Word2Vec
import re

split_re = re.compile(r"([^a-zA-Z0-9])")

def spliter(code):
    code = re.sub(r"^b'\s.*/\*.*$", "", str(code))
    code = re.sub(r"^b'\s.*\*.*$", "", str(code))
    code = re.sub(r"b'.*\*/$", "", str(code))
    code = re.sub(r"^b'\s.*\*/.*$", "", str(code))
    code = re.sub(r"//.*$", "", str(code))
    code = re.sub(r"<!--.*$", "", str(code))
    code = re.sub(r"<%/\*.*$", "", str(code))
    code = re.sub(r"<%--.*$", "", str(code))
    code = re.sub(r"^b'\s.*\*.*$", "", str(code))
    code = str(code).strip("b'").strip(r"\\r\\n").strip(r"\r\n")
    return [w for w in split_re.split(code) if w and w != " "]

class Sentences():
    def __init__(self, path, spliter):
        self.path = path
        self._spliter = spliter

    def __iter__(self):
        file_list = os.listdir(self.path)
        for file_index in file_list:
            a = []
            for line in open(os.path.abspath(os.curdir) + '/dataset/cleaned/' + str(file_index), 'rb'):
            #     line = re.sub(r'[^\x00-\x7F]+',' ', str(line))
            #     char = ['\t', '\n', '\\t', '\\n', '<?php', '?>', ';', '<html', '</html>', '<body', '</body>', '>',
            #             '<head', '</head>', '<meta', '/>', '<title', '</title>', '<style>', '</style>', '<script',
            #             '</script>', '<a', '</a>', '<p', '</p>', '<div', '</div>', '<b', '</b>']
            #     for i in char:
            #         line = line.strip(i)
            #     line = line.split(' ')
            #     a = a + line
            # yield a
                yield self._spliter(str(line).strip("\r\n"))



#训练词向量模型
path = os.path.abspath(os.curdir) + '/dataset/cleaned/'
sentences = Sentences(path, spliter)
word_model = Word2Vec(sentences,vector_size=128,window=10,min_count=5)
output = "word_train.model"
word_model.save(output)


