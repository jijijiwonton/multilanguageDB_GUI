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
window.geometry("1300x700")
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

def displayInEnglish():
    clear_frame()
    cursor.execute(f"SELECT fruit.id, fruit_name, fruit_benefit, fruit_season, calories FROM fruit INNER JOIN fruit_translation_entry ON title = translation_id INNER JOIN fruit_language ON language_code = code WHERE fruit_language.code = 'En';")        

    display( 'ID', 'Name', 'Calories', 'Benefit', 'Season')
    
def displayInKorean():
    clear_frame()
    cursor.execute(f"SELECT fruit.id, fruit_name, fruit_benefit, fruit_season, calories FROM fruit INNER JOIN fruit_translation_entry ON title = translation_id INNER JOIN fruit_language ON language_code = code WHERE fruit_language.code = 'Ko';")        

    display( '아이디(ID)','이름(Name)', '칼로리(Calories)', '효능(Benefit)', '제철(Season)')

def displayInFrench():
    clear_frame()
    cursor.execute(f"SELECT fruit.id, fruit_name, fruit_benefit, fruit_season, calories FROM fruit INNER JOIN fruit_translation_entry ON title = translation_id INNER JOIN fruit_language ON language_code = code WHERE fruit_language.code = 'Fr';")

    display('ID', 'Nom(Name)', 'calories', 'bénéficier à(Benefit)', 'saison(Season)')

'''Display data in different languages'''
def display(idField, nameField, caloriesField, benefitField, seasonField):
    i = 6

    rows = cursor.fetchall()
    print(rows)
    
    if len(rows) != 0:
        id = Label(frame, text=f"{idField}",
                              style="W.Label", width=17, background= vintagePink)
        name= Label(frame, text=f"{nameField}",
                               style="W.Label", width=17, background=vintagePink)
        benefit = Label(frame, text=f"{benefitField}",
                               style="W.Label", width=17, background=vintagePink)
        season = Label(frame, text=f"{seasonField}",
                               style="W.Label", width=20, background=vintagePink)
        calories = Label(frame, text=f"{caloriesField}",
                               style="W.Label", width=20, background=vintagePink)
        
        id.grid(pady=5, column=0, row=5)
        name.grid(pady=5, column=1, row=5)
        benefit.grid(pady=5, column=2, row=5)
        season.grid(pady=5, column=3, row=5)
        calories.grid(pady=5, column=4, row=5)
       

        
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


'''Graphical User Interface'''

'''Button UI'''
item_name = Label(text="Multilingual - Translation table approach", style="W.Label")
item_name.grid(row=0, column=0,  pady=(10, 10))

'''Bilingual field'''
switchToEnglishBtn = Button(text="English", command= displayInEnglish, style="W.TButton")
switchToEnglishBtn.grid(row=1, column=0, pady=(10, 0))

switchToKoreanBtn = Button(text="Korean", command= displayInKorean, style="W.TButton")
switchToKoreanBtn.grid(row=1, column=1,  pady=(10, 0))

switchToFrenchBtn = Button(text="French", command= displayInFrench, style="W.TButton")
switchToFrenchBtn.grid(row=1, column=2,  pady=(10, 0))

'''Label and Input field'''

id = Label(text="ID", style="W.Label")
id.grid(row=2, column=0, pady=(10, 0))

id_input = Entry()
id_input.grid(row=3, column=0, pady=(10, 0))

item_name = Label(text="Item name", style="W.Label")
item_name.grid(row=2, column=1,  pady=(10, 0))

item_name_input = Entry()
item_name_input.grid(row=3, column=1, pady=(10, 0))

fruit_name = Label(text="Benefit", style="W.Label")
fruit_name.grid(row=2, column=2, pady=(10, 0))

fruit_name_input = Entry()
fruit_name_input.grid(row=3, column=2, pady=(10, 0))

calories = Label(text="Calories", style="W.Label")
calories.grid(row=2, column=3, pady=(10, 0))

calories = Entry()
calories.grid(row=3, column=3, pady=(10, 0)) 

season = Label(text="Season", style="W.Label")
season.grid(row=2, column=4,pady=(10, 0))

season_input = Entry()
season_input.grid(row=3, column=4, pady=(10, 0))

'''Run the program'''
window.mainloop()
