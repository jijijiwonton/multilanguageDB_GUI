# IMPORTING PYTHON LIBRARIES
from tkinter import *
from tkinter import messagebox
from tkinter.ttk import *
import datetime
import mysql.connector

'''Define global variables'''
purePink ="#f7bacf"
lightPink = "#ffedff"
catchyPink = "#f06292"
vintagePink = "#c38a9e"
window = Tk()

'''TkInter Configuration'''
window.title("Multilanguage Database - Bilingual Approach fields")
window.geometry("1200x700")
window.config(padx=40, pady=50, bg=lightPink)

frame = Frame(window, width=800, borderwidth=10)
frame.grid(row=11, column=0, columnspan=8, pady=(2, 0))

'''Style Object'''
style = Style()

style.configure('W.TButton', font=('calibri', 10, 'bold'),
                bg=vintagePink)
style.configure('W.Label', font=("calibri", 12, 'bold'),
                color=catchyPink)

'''Clear frame to avoid overwrite data display'''
def clear_frame():
    for widgets in frame.winfo_children():
        widgets.destroy()

'''Connection validation to DB'''
try:
    con = mysql.connector.connect(
        host='localhost', user='root', password='root', database='multi')
except:
    print("Error connecting to the database!")

else:
    print("Database has been created successfully!")

cursor = con.cursor()

'''Database Operations'''

'''Create a table for bilingual fields approach'''
def createTable():
    bilingual = "CREATE TABLE IF NOT EXISTS bilingualFields (id int(10) NOT NULL AUTO_INCREMENT, name_en varchar(50) NOT NULL, name_ko varchar(50) NOT NULL, calories int NOT NULL, benefit_en varchar(255) NOT NULL, benefit_ko varchar(255) NOT NULL, season_en varchar(10) NOT NULL, season_ko varchar(10) NOT NULL, PRIMARY KEY (`id`));"
    # TODO: The table creation should be in the same GUI or create another GUI?
    # multilingual = "CREATE TABLE IF NOT EXISTS multiLanguagesFields (id int(10) NOT NULL AUTO_INCREMENT, title_en varchar(255) NOT NULL, title_ko varchar(255) NOT NULL, title_ch varchar(255) NOT NULL, title_fr varchar(255) NOT NULL, title_sp varchar(255) NOT NULL, benefit_en varchar(255) NOT NULL, benefit_ko varchar(255) NOT NULL, benefit_ch varchar(255) NOT NULL, benefit_fr varchar(255) NOT NULL, benefit_sp varchar(255) NOT NULL, PRIMARY KEY (`id`));"
    cursor.execute(bilingual)
    # TODO: ...
    # cursor.execute(multilingual)
    messagebox.showinfo(title="CREATE Operation 💗", message="A few bilingual fields table is created 💗")
    
'''Display data in English'''
def displayInEnglish():
    clear_frame()
    i = 6
    cursor.execute(f"SELECT id, name_en, calories, benefit_en, season_en FROM bilingualFields")
    rows = cursor.fetchall()
    print(rows)
    
    if len(rows) != 0:
        id = Label(frame, text="ID",
                              style="W.Label", width=10, background= vintagePink)
        name_en = Label(frame, text="Name",
                              style="W.Label", width=10, background= vintagePink)
        calories = Label(frame, text="Calories",
                               style="W.Label", width=10, background= vintagePink)
        benefit_en = Label(frame, text="Benefit", style="W.Label", width=10, background= vintagePink)
        season_en = Label(frame, text="Season",
                               style="W.Label", width=10, background= vintagePink)

        id.grid(pady=5, column=0, row=5)
        name_en.grid(pady=5, column=1, row=5)
        calories.grid(pady=5, column=2, row=5)
        benefit_en.grid(pady=5, column=3, row=5)
        season_en.grid(pady=5, column=4, row=5)
        
        for row in rows:
            '''Display item'''
            display_id = Label(
                frame, text=f"{row[0]}", style="W.Label", background=purePink)
            display_name_en = Label(
                frame, text=f"{row[1]}", style="W.Label", background=purePink)
            display_benefit_en = Label(
                frame, text=f"{row[2]}", style="W.Label", background=purePink)
            display_calories = Label(
                frame, text=f"{row[3]}", style="W.Label", background=purePink)
            display_season_en = Label(
                frame, text=f"{row[4]}", style="W.Label", background=purePink)

            display_id.grid(pady=(2, 0), row=i, column=0)
            display_name_en.grid(pady=(2, 0), row=i, column=1)
            display_benefit_en.grid(pady=(2, 0), row=i, column=2)
            display_calories.grid(pady=(2, 0), row=i, column=3)
            display_season_en.grid(pady=(2, 0), row=i, column=4)

            print(row)
            i += 1
    else:
        messagebox.showerror(title="READ ERROR! ⚒️", message="No data found! ⚒️")
   
'''Display data in Korean'''     
def displayInKorean():
    clear_frame()
    i = 6
    cursor.execute(f"SELECT id, name_ko, calories, benefit_ko, season_ko FROM bilingualFields")
    rows = cursor.fetchall()
    print(rows)
    
    if len(rows) != 0:
        id = Label(frame, text="아이디(ID)",
                              style="W.Label", width=15, background= vintagePink)
        name_ko = Label(frame, text="이름(Name)",
                               style="W.Label", width=15, background=vintagePink)
        calories = Label(frame, text="칼로리(Calories)",
                               style="W.Label", width=15, background=vintagePink)
        benefit_ko = Label(frame, text="효능(Benefit)",
                               style="W.Label", width=15, background=vintagePink)
        season_ko = Label(frame, text="계절(Season)",
                               style="W.Label", width=15, background=vintagePink)
        
        id.grid(pady=5, column=0, row=5)
        name_ko.grid(pady=5, column=1, row=5)
        calories.grid(pady=5, column=2, row=5)
        benefit_ko.grid(pady=5, column=3, row=5)
        season_ko.grid(pady=5, column=4, row=5)
        
        for row in rows:

            '''Display item'''
            display_id = Label(
                frame, text=f"{row[0]}", style="W.Label", background=purePink)
            display_name_ko = Label(
                frame, text=f"{row[1]}", style="W.Label", background=purePink)
            display_benefit_ko = Label(
                frame, text=f"{row[2]}", style="W.Label", background=purePink)
            display_calories = Label(
                frame, text=f"{row[3]}", style="W.Label", background=purePink)
            display_season_ko = Label(
                frame, text=f"{row[4]}", style="W.Label", background=purePink)

            display_id.grid(pady=(2, 0), row=i, column=0)
            display_name_ko.grid(pady=(2, 0), row=i, column=1)
            display_benefit_ko.grid(pady=(2, 0), row=i, column=2)
            display_calories.grid(pady=(2, 0), row=i, column=3)
            display_season_ko.grid(pady=(2, 0), row=i, column=4)

            print(row)
            i += 1
    else:
        messagebox.showerror(title="READ ERROR! ⚒️", message="No data found! ⚒️")

'''Insert a record'''
def insert():
    name_en = name_en_input.get()
    name_ko = name_ko_input.get()
    benefit_en = benefit_en_input.get()
    benefit_ko = benefit_ko_input.get()
    calories = calories_input.get()
    season_en = season_en_input.get()
    season_ko = season_ko_input.get()

    try:
        cursor.execute(f"INSERT INTO bilingualFields (name_en, name_ko, calories, benefit_en, benefit_ko, season_en, season_ko) VALUES('{name_en}', '{name_ko}', {calories},'{benefit_en}', '{benefit_ko}', '{season_en}', '{season_ko}');")
        affected_rows = cursor.rowcount
        print(f"Rows affected: {affected_rows}")
        if affected_rows is not None:
            con.commit()
            messagebox.showinfo(title="INSERT Operation 💗",
                                        message="Data has been inserted successfully! 💗")

            # After click 'insert' button, it clears the input field to be empty for a user convenience
            name_en_input.delete(0, END)
            name_ko_input.delete(0, END)
            benefit_en_input.delete(0, END)
            benefit_ko_input.delete(0, END)
            calories_input.delete(0, END)
            season_en_input.delete(0, END)
            season_ko_input.delete(0, END)
            
        else:
            messagebox.showerror(title="INSERT ERROR! ⚒️", message="An error has occurred! ⚒️")
            
    except Exception:
            messagebox.showerror(title="INSERT ERROR! ⚒️", message="An error has occurred! ⚒️")

'''Delete a specific data using ID'''
def delete():
    id = id_input.get()
    cursor.execute(f"DELETE FROM bilingualFields WHERE ID='{id}';")
    affected_rows = cursor.rowcount
    print(f"Rows affected: {affected_rows}")

    if affected_rows != 0:
        con.commit()
        messagebox.showinfo(title="DELETE Operation ❌",
                            message="All data is deleted successfully ❌")
        
        id_input.delete(0, END)
    else:
        messagebox.showerror(title="DELETE ERROR ❌",
                             message="Data was not found or Invalid ID ❌")

'''Update a specific data using ID'''
def update():
    id = id_input.get()
    name_en = name_en_input.get()
    name_ko = name_ko_input.get()
    benefit_en = benefit_en_input.get()
    benefit_ko = benefit_ko_input.get()
    calories = calories_input.get()
    season_en = season_en_input.get()
    season_ko = season_ko_input.get()
    
    cursor.execute(f"UPDATE bilingualFields SET name_en='{name_en}', name_ko='{name_ko}', calories ='{calories}', benefit_en ='{benefit_en}', benefit_ko ='{benefit_ko}', season_en ='{season_en}', season_ko ='{season_ko}' WHERE ID='{id}';")
    affected_rows = cursor.rowcount
    print(f"Rows affected: {affected_rows}")
    
    if affected_rows != 0:
        con.commit()
        messagebox.showinfo(title="UPDATE Operation 💗", message="Data has been updated successfully! 💗")
        
        id = id_input.delete(0, END)
        name_en_input.delete(0, END)
        name_ko_input.delete(0, END)
        benefit_en_input.delete(0, END)
        benefit_ko_input.delete(0, END)
        calories_input.delete(0, END)
        season_en_input.delete(0, END)
        season_ko_input.delete(0, END)
    else:
        messagebox.showerror(title="UPDATE ERROR! ❌",
                                 message="Invalid ROLL number! ❌")

'''Graphical User Interface'''

'''Button UI'''
name_en = Label(text="Bilingual - Column approach", style="W.Label")
name_en.grid(row=0, column=0,  pady=(10, 10))

create_table_btn = Button(text="CREATE A TABLE", command= createTable, style="W.TButton")
create_table_btn.grid(row=1, column=0,   padx=5)

add_btn = Button(text="INSERT", command=insert, style="W.TButton")
add_btn.grid(row=1, column=1,   padx=5)

delete_button = Button(text="DELETE", command=delete,
                       width=10, style="W.TButton")
delete_button.grid(row=1, column=2,   padx=5)

update_button = Button(text="UPDATE", command=update,
                       width=10, style="W.TButton")
update_button.grid(row=1, column=3,   padx=5)

'''Bilingual field'''
switchToEnglishBtn = Button(text="English", command= displayInEnglish, style="W.TButton")
switchToEnglishBtn.grid(row=2, column=0, pady=(10, 0))

switchToKoreanBtn = Button(text="Korean", command= displayInKorean, style="W.TButton")
switchToKoreanBtn.grid(row=2, column=1,  pady=(10, 0))

'''Label and Input field'''
name_en = Label(text="Name_en", style="W.Label")
name_en.grid(row=3, column=0,  pady=(10, 0))

name_en_input = Entry()
name_en_input.grid(row=3, column=1, pady=(10, 0))

name_ko = Label(text="Name_ko", style="W.Label")
name_ko.grid(row=4, column=0, pady=(10, 0))

name_ko_input = Entry()
name_ko_input.grid(row=4, column=1, pady=(10, 0))

calories = Label(text="Calories", style="W.Label")
calories.grid(row=5, column=0, pady=(10, 0))

calories_input = Entry()
calories_input.grid(row=5, column=1, pady=(10, 0)) 

benefit_en = Label(text="Benefit_en", style="W.Label")
benefit_en.grid(row=6, column=0,pady=(10, 0))

benefit_en_input = Entry()
benefit_en_input.grid(row=6, column=1, pady=(10, 0))

benefit_ko = Label(text="Benefit_ko", style="W.Label")
benefit_ko.grid(row=7, column=0, pady=(10, 0))

benefit_ko_input = Entry()
benefit_ko_input.grid(row=7, column=1, pady=(10, 0))

season_en = Label(text="Season_en", style="W.Label")
season_en.grid(row=8, column=0, pady=(10, 0))

season_en_input = Entry()
season_en_input.grid(row=8, column=1, pady=(10, 0))

season_ko = Label(text="Season_ko", style="W.Label")
season_ko.grid(row=9, column=0, pady=(10, 0))

season_ko_input = Entry()
season_ko_input.grid(row=9, column=1, pady=(10, 0))

id = Label(text="ID", style="W.Label")
id.grid(row=3, column=2, pady=(10, 0))

id_input = Entry()
id_input.grid(row=3, column=3, pady=(10, 0))

'''Run the program'''
window.mainloop()
