# THPj10-send_emails

Envoi d'emails en masse

Ce projet te donnera les compétences de manipuler des gems à la fois, et de faire des beaux rapprochements pour des programmes stylays.

Pour ce programme, nous allons te faire travailler sur un cas concret pour The Hacking Project car

    nous l'aurions fait nous-même
    cela fait travailler pour un cas concret d'entreprise
    qui de mieux que les moussaillons pour parler de The hacking Project ❤️

Alors oui c'est un peu chaffouin dans la démarche, mais comme dirait un célèbre philosophe : "YOLO".

a. Envoi d'emails

Le CEO de get-email-corp est vraiment ravi de ton travail. Il veut donc te nommer en charge de la filliale send-email-corp, qui vient de décrocher un contrat à 300k€ pour une startup qui s'appelle The Hacking Project. Ta mission est d'envoyer un email à toutes les mairies d'un département de ton choix, pour leur dire que tu es élève à The Hacking Project, et que tu aimerais voir ce modèle du peer-learning exister dans ce beau département.

Voici la marche à suivre :

    Tu vas devoir crééer un programme scrapping.rb qui va utiliser le code de scrapping du projet de vendredi pour récupérer les adresses emails des mairies du <%= current_user.id %>, voire un ou plusieurs autres départements si tu te sens chaud la braise
        Ton programme ira engregistrer tous tes scrappings dans un beau fichier Google Spreadsheet, un peu comme ce que tu as fait hier
    Après, tu vas créér un programme send_emails.rb, qui va reprendre chaque colonne de ton Spreadsheet, et qui va envoyer un bel email à la mairie indiquée. Pour ceux qui ont peur d'utiliser leur adresse Gmail perso, vous êtes bien entendu libres d'utiliser une adresse d'une fausse personne, comme par exemple "Théophile Coutaind", vous n'aurez qu'à nous transférer les emails vers nous.
        Une méthode send_email_to_line fait très bien l'affaire. Elle prendra l'email en colonne B, et lui enverra un message, qui pourra être alterné en fonction du nom de la mairie en colonne A.
        Tu peux la coupler à une méthode go_through_all_the_lines
        Je te conseille de faire une méthode get_the_email_html qui prend le nom de la ville concernée, et qui renvoie un beau HTML
        (Aussi, nous te conseillons de partir sur un fichier sreadsheet qui contient des adresses email tests afin de voir si ça marche, avant d'envoyer la masse)
    Pour l'email, tu peux créér un truc simple en HTML qui dit un truc du genre :

    Bonjour,
    Je m'appelle Prénom, je suis élève à une formation de code gratuite, ouverte à tous, sans restriction géographique, ni restriction de niveau. La formation s'appelle The Hacking Project (http://thehackingproject.org/). Nous apprenons l'informatique via la méthode du peer-learning : nous faisons des projets concrets qui nous sont assignés tous les jours, sur lesquel nous planchons en petites équipes autonomes. Le projet du jour est d'envoyer des emails à nos élus locaux pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation gratuite.

    Nous vous contactons pour vous parler du projet, et vous dire que vous pouvez ouvrir une cellule à {townhall_name}, où vous pouvez former gratuitement 6 personnes (ou plus), qu'elles soient débutantes, ou confirmées. Le modèle d'éducation de The Hacking Project n'a pas de limite en terme de nombre de moussaillons (c'est comme cela que l'on appelle les élèves), donc nous serions ravis de travailler avec {townhall_name} !

    Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80

        Bref, à toi de voir quel wording est le mieux, demande aux experts en CRM pour des bow wordings stylay ;)



⚠️ Attention ! Tu dois rendre le projet aujourd'hui ! ⚠️ Pas de projet rendu = un joker cramé.
Pour rendre le projet, mets en ligne ici les liens demandés. Mets un nom explicite pour faciliter la tâche aux correcteurs.
