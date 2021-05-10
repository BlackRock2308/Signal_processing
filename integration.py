import sqlite3
from database import display_table, create_table_db
from db.CRUD import save_db, delete_db, modifier_db, get_db

#fonction pour créer la connection à notre base de données
def create_connection(db_file):
    """ create a database connection to the SQLite database
    """
    conn = None
    try:
        conn = sqlite3.connect(db_file)
    except Exception as err:
        print('Error while connecting to the database')

    return conn


def main():
    database = "dic-database.db"

    # create a database connection
    conn = create_connection(database)

    #create_table_db(conn)
    
    data = [
        ('Diakhoumpa', 'Oumou','GEC','DIC1','771241893'),
        ('Sadji', 'Abdoulaye','GIT','DIC1','78098893')
    ]

    #save_db(conn, data)


    #supprimer les information de l'ingénieur Abdoulaye Sadji
    info = [('Sadji','Abdoulaye')]
    #delete_db(conn,info)


    #modifier les informations de l'ingénieur qui à l'id 9
    task = ('Faye', 'Soudou','GEC','DIC2','767890983',9)
    #modifier_db(conn,task)

    #affichage sous forme de key:value

    value = 8
    get_db(conn, value)


    #Afficher le contenu de la table DIC de notre bd
    #display_table(conn)


if __name__ == '__main__':
    main()
