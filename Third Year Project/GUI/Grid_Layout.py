from tkinter import *

root = Tk()

label_1 = Label(root, text="Name")
label_2 = Label(root, text="Password")
entry_1 = Entry(root) #input from user
entry_2 = Entry(root)

#think of an excel sheet

label_1.grid(row=0, sticky=E) #by default column is equal to 0 #E means EAST so place to right, i.e right align
label_2.grid(row=1, sticky=E)
entry_1.grid(row=0, column=1)
entry_2.grid(row=1, column=1)

c = Checkbutton(root, text="Keep Me Logged In")
c.grid(columnspan=2)

root.mainloop()