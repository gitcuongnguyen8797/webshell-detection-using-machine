import re
from collections import Counter
from config import *
from libs.helper import *

class ExtractFeatures:
    
    def __init__(self, file, export_to) -> None:
        self.resource = ROOT_DIR + file
        self.export_to = ROOT_DIR + export_to
        self._sensitive_functions = ['exec', 'shell_exec', 'passthru', 'system', 'show_source', 'proc_open', 'pcntl_exec', 'eval', 'assert']
        self._df = None

    def extract_function_names(self):
        filter = [
            'if', 'while', 'die', 'elseif', 'go', 'back', 'sort', 'foreach', 'switch', 'trim', 'array', 'count',
            'session_start', 'header', 'try', 'catch', 'floor', 'round', 'max', 'min', 'session_destroy', 'css', 'pagination',
            'add', 'pop', 'shift', 'edit', 'int32', 'end', 'prev','next', 'for'
        ]
        regex = re.compile(r"(?<=[\s|\;|\:|\=|\-|\+|\]|\[|\`|\.|\<])[a-zA-Z][a-zA-Z0-9\_]{1,255}(?=\()")
        with open(self.resource, 'r', encoding='ISO-8859-1') as file:
          results = [x.lower() for x in regex.findall(file.read())]
          return Counter([result for result in results if result not in filter])
    
    def extract_entropy_file(self):
        return calc_entropy(self.resource)

    def extract_longest_string(self):
        longest_string = ''
        with open(self.resource, 'r', encoding='ISO-8859-1') as file:
            lines = file.readlines()
            longest_string = max(lines, key=len)
            return len(longest_string)
    def extract_danger_functions(self):
        return

    def extract_by_word2vec(self):
        return None
    