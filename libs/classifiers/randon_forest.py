from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn import metrics
import pandas as pd
from config import *

class RandomForest:
    def __init__(self) -> None:
        self.model = self.train()
        self.df = pd.read_csv(ROOT_DIR + 'dataset.csv')

    def train(self):
        X = self.df.drop(columns=['no', 'class'])
        Y = self.df['class']
        x_train, x_test, y_train, y_test = train_test_split(X, Y, test_size=0.3)
        model = RandomForestClassifier(n_estimators=100)
        y_pred= model.predict(x_test)
        print ('Current Accuracy is: %2f' % metrics.accuracy_score(y_test, y_pred))
        return model.fit(x_train, y_train)

    def predict(self, extracted_features):
        return self.model.predict(extracted_features)

