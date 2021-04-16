import tkinter as tk


class Application(tk.Frame):
    def __init__(self, master=None):
        super().__init__(master)
        self.master = master
        self.pack()
        self.create_widgets()

    def create_widgets(self):
        self.hi_there = tk.Button(self)
        self.hi_there["text"] = "Hello World\n(click me)"
        self.hi_there["command"] = self.say_hi
        self.hi_there.grid(row=0, column=0)

        for i in range(1, total_rows+1):
            for j in range(total_columns):

                self.e = tk.Entry(self, width=20, fg='blue',
                                  font=('Arial', 16, 'bold'))

                self.e.grid(row=i, column=j)
                self.e.insert(tk.END, lst[i-1][j])

        self.quit = tk.Button(self, text="QUIT", fg="red",
                              command=self.master.destroy)
        self.quit.grid(row=total_rows+1, column=total_columns - 1)

    def say_hi(self):
        print("hi there, everyone!")


# take the data
lst = [(1, 'Raj', 'Mumbai', 19),
       (2, 'Aaryan', 'Pune', 18),
       (3, 'Vaishnavi', 'Mumbai', 20),
       (4, 'Rachna', 'Mumbai', 21),
       (5, 'Shubham', 'Delhi', 21)]

# find total number of rows and
# columns in list
total_rows = len(lst)
total_columns = len(lst[0])

root = tk.Tk()
app = Application(master=root)
app.mainloop()
