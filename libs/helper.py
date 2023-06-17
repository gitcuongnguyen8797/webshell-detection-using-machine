import math

"""
  Calculate entropy a file as feature of webshell detection method
  References:
    - https://www.linkedin.com/pulse/hunting-base64-php-webshells-shannon-entropy-technique-amir-rasa/?trk=articles_directory
    - https://stackoverflow.com/questions/990477/how-to-calculate-the-entropy-of-a-file
"""
def calc_entropy(file):
    entropy = 0.0
    with open(file, 'rb') as f:
      data = f.read()
      possible = dict(((chr(x), 0) for x in range(0, 256)))

      for byte in data:
          possible[chr(byte)] +=1

      data_len = len(data)

      # compute
      for i in possible:
          if possible[i] == 0:
              continue

          p = float(possible[i] / data_len)
          entropy -= p * math.log(p, 2)
    return entropy

"""
  This feature only affected to specific language when extracting feature
"""
def using_word2vec(file):
    pass