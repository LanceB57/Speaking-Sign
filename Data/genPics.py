import pandas as pd
import xlrd
from PIL import Image

data = pd.read_csv("Data/test/sign_mnist_test.csv")

for i in range(len(data)):
    row = data.iloc[i]
    label = row['label']
    im = Image.new('L', (28, 28))
    im.putdata(row[1:])

    name = str(i)
    path = "Data/test/" + str(label + 1) + "/" + name + ".png"
    im.save(path)
    if i % 1000 == 0:
        print(i)