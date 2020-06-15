from tkinter import *

root = Tk()

#one method
#def printName():
#    print("Hello my name is Nishat!")

# button_1 = Button(root, text="Print my name", command=printName)
# button_1.pack()

#second method
def printName(event):
    print("Hello my name is Nishat!")

button_1 = Button(root, text="Print my name")
button_1.bind("<Button-1>", printName)
button_1.pack()

root.mainloop()