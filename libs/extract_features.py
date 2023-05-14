import re
import os
import pandas as pd

class ExtractFunctionName:
    def __init__(self, folder) -> None:
        self.function_names = []
        self.__folderPath = folder
        self.__regex = r"(?:\w[a-zA-z]+[a-zA-z0-9\_]*(?=\())"

    def find_all(self, text):
        return re.findall(self.__regex, text)

    def extract_function_name(self):
        for file_name in os.listdir(self.__folderPath):
            with open(self.__folderPath + '/' + file_name, 'r', encoding='ISO-8859-1') as file:
                self.function_names += self.find_all(file.read())
        
    def unique_array_function_name(self):
        results = dict()
        counter = 1
        for i in self.function_names:
            if (results.get(i)):
                results[i] += counter
            else:
                results[i] = counter
        return results


def extract_function_name(file):
    regex = re.compile(r"[a-zA-z][a-zA-z0-9\_]{1,255}(?=\()")
    with open(file, 'r', encoding='ISO-8859-1') as file:
        return regex.findall(file.read())
    
def unique_array_function_name(arr):
    results = dict()
    counter = 1
    for i in arr:
        if (results.get(i)):
            results[i] += counter
        else:
            results[i] = counter
    return results

