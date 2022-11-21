# IMPORTING PYTHON LIBRARIES
from tkinter import *
from tkinter import messagebox
from tkinter.ttk import *
import mysql.connector

purePink ="#fce4ec"
lightPink = "#fce4ec"
catchyPink = "#f06292"
vintagePink = "#c38a9e"
window = Tk()

# TkInter Configuration
window.title("Multilanguage Database - Bilingual Approach fields")
window.geometry("700x400")
window.config(padx=40, pady=50, bg=lightPink)

frame = Frame(window, width=500, borderwidth=10)

frame.grid(row=6, column=0, columnspan=8, pady=(10, 0))

# Style Object
style = Style()

style.configure('W.TButton', font=('calibri', 10, 'bold'),
                bg=vintagePink)
style.configure('W.Label', font=("calibri", 12, 'bold'),
                color=catchyPink)

# Clear frame to avoid overwrite data display
def clear_frame():
    for widgets in frame.winfo_children():
        widgets.destroy()

# Connection validation to DB
try:
    con = mysql.connector.connect(
        host='localhost', user='root', password='root', database='multi')
except:
    print("Error connecting to the database!")

else:
    print("Database has been created successfully!")

cursor = con.cursor()

# Database Operations
def createTable():
    bilingual = "CREATE TABLE IF NOT EXISTS bilingualFields (id int(10) NOT NULL AUTO_INCREMENT, title_en varchar(255) NOT NULL, title_ko varchar(255) NOT NULL, benefit_en varchar(255) NOT NULL, benefit_ko varchar(255) NOT NULL, PRIMARY KEY (`id`));"
    # TODO: The table creation should be in the same GUI or create another GUI?
    # multilingual = "CREATE TABLE IF NOT EXISTS multiLanguagesFields (id int(10) NOT NULL AUTO_INCREMENT, title_en varchar(255) NOT NULL, title_ko varchar(255) NOT NULL, title_ch varchar(255) NOT NULL, title_fr varchar(255) NOT NULL, title_sp varchar(255) NOT NULL, benefit_en varchar(255) NOT NULL, benefit_ko varchar(255) NOT NULL, benefit_ch varchar(255) NOT NULL, benefit_fr varchar(255) NOT NULL, benefit_sp varchar(255) NOT NULL, PRIMARY KEY (`id`));"
    cursor.execute(bilingual)
    # TODO: ...
    # cursor.execute(multilingual)
    messagebox.showinfo(title="CREATE Operation 💗", message="A few bilingual fields table is created 💗")
    
def displayInEnglish():
    clear_frame()
    i = 6
    cursor.execute(f"SELECT title_en, benefit_en FROM bilingualFields")
    rows = cursor.fetchall()
    print(rows)
    
    if len(rows) != 0:
        title_en = Label(frame, text="Title(EN)",
                              style="W.Label", width=10, background= vintagePink)
        benefit_en = Label(frame, text="Benefit(EN)",
                               style="W.Label", width=10, background= vintagePink)

        title_en.grid(pady=5, column=0, row=5)
        benefit_en.grid(pady=5, column=1, row=5)
        
        for row in rows:
            '''Display item'''
            
            display_title_en = Label(
                frame, text=f"{row[0]}", style="W.Label", background=purePink)
            display_benefit_En = Label(
                frame, text=f"{row[1]}", style="W.Label", background=purePink)


            display_title_en.grid(pady=(2, 0), row=i, column=0)
            display_benefit_En.grid(pady=(2, 0), row=i, column=1)

            print(row)
            i += 1
    else:
        messagebox.showerror(title="READ ERROR! ⚒️", message="No data found! ⚒️")
        
def displayInKorean():
    clear_frame()
    i = 6
    cursor.execute(f"SELECT title_ko, benefit_ko FROM bilingualFields;")
    rows = cursor.fetchall()
    print(rows)
    
    if len(rows) != 0:

        title_ko = Label(frame, text="Title(KO)",
                               style="W.Label", width=10, background=vintagePink)
        benefit_ko = Label(frame, text="Benefit(KO)",
                               style="W.Label", width=10, background=vintagePink)
        title_ko.grid(pady=5, column=1, row=5)
        benefit_ko.grid(pady=5, column=2, row=5)
        
        for row in rows:

            '''Display item'''
            display_label = Label(
                frame, text=f"{row[0]}", style="W.Label", background=purePink)
            display_label4 = Label(
                frame, text=f"{row[1]}", style="W.Label", background=purePink)

            display_label.grid(pady=(2, 0), row=i, column=1)
            display_label4.grid(pady=(2, 0), row=i, column=2)

            print(row)
            i += 1
    else:
        messagebox.showerror(title="READ ERROR! ⚒️", message="No data found! ⚒️")

def insert():
    title_en = title_en_input.get()
    title_ko = title_ko_input.get()
    benefit_en = benefit_en_input.get()
    benefit_ko = benefit_ko_input.get()

    try:
        cursor.execute(f"INSERT INTO bilingualFields (title_en, title_ko, benefit_en, benefit_ko) VALUES('{title_en}', '{title_ko}', '{benefit_en}', '{benefit_ko}');")
        affected_rows = cursor.rowcount
        print(f"Rows affected: {affected_rows}")
        if affected_rows is not None:
            con.commit()
            messagebox.showinfo(title="INSERT Operation 💗",
                                        message="Data has been inserted successfully! 💗")
            title_en_input.delete(0, END)
            title_ko_input.delete(0, END)
        else:
            messagebox.showerror(title="INSERT ERROR! ⚒️", message="An error has occurred! ⚒️")
            
    except Exception:
            messagebox.showerror(title="INSERT ERROR! ⚒️", message="An error has occurred! ⚒️")

def delete():
    cursor.execute(f"DELETE FROM bilingualFields;")
    affected_rows = cursor.rowcount
    print(f"Rows affected: {affected_rows}")

    if affected_rows != 0:
        con.commit()
        messagebox.showinfo(title="DELETE Operation ❌",
                            message="All data is deleted successfully ❌")
    else:
        messagebox.showerror(title="DELETE ERROR ❌",
                             message="Data was not found ❌")
        
# TODO: Implementation needed
def update():
    pass



# Graphical User Interface

# Button field
create_table_btn = Button(text="CREATE A TABLE", command= createTable, style="W.TButton")
create_table_btn.grid(row=0, column=0,   padx=5)

add_btn = Button(text="INSERT", command=insert, style="W.TButton")
add_btn.grid(row=0, column=1,   padx=5)

delete_button = Button(text="DELETE", command=delete,
                       width=10, style="W.TButton")
delete_button.grid(row=0, column=2,   padx=5)

update_button = Button(text="UPDATE", command=update,
                       width=10, style="W.TButton")
update_button.grid(row=0, column=3,   padx=5)

# Bilingual field
switchToEnglishBtn = Button(text="English", command= displayInEnglish, style="W.TButton")
switchToEnglishBtn.grid(row=1, column=0, pady=(10, 0))

switchToKoreanBtn = Button(text="Korean", command= displayInKorean, style="W.TButton")
switchToKoreanBtn.grid(row=1, column=1,  pady=(10, 0))


# # Label and Input field
title_en = Label(text="Title_en", style="W.Label")
title_en.grid(row=2, column=0,  pady=(10, 0))

title_en_input = Entry()
title_en_input.grid(row=2, column=1, pady=(10, 0))

title_ko = Label(text="Title_ko", style="W.Label")
title_ko.grid(row=3, column=0, pady=(10, 0))

title_ko_input = Entry()
title_ko_input.grid(row=3, column=1, pady=(10, 0))

benefit_en = Label(text="Benefit_en", style="W.Label")
benefit_en.grid(row=4, column=0,pady=(10, 0))

benefit_en_input = Entry()
benefit_en_input.grid(row=4, column=1, pady=(10, 0))

benefit_ko = Label(text="Benefit_ko", style="W.Label")
benefit_ko.grid(row=5, column=0, pady=(10, 0))

benefit_ko_input = Entry()
benefit_ko_input.grid(row=5, column=1, pady=(10, 0))

# Run the program
window.mainloop()
