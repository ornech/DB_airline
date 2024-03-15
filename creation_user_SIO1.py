etudiants = [
(1, 'Loann', '28012005'),
(2, 'Killian', '16052005'),
(3, 'Axel', '06072004'),
(4, 'Gabin', '20082004'),
(5, 'Logan', '22092005'),
(6, 'Alexandre', '15062005'),
(7, 'Alexis', '12082005'),
(8, 'Manon', '11072005'),
(9, 'Mathéo', '24082005'),
(10, 'Astghik', '26082002'),
(11, 'Noah', '14012002'),
(12, 'Erwan', '24092004'),
(13, 'Clement', '09122005'),
(14, 'Kyllian', '19012005'),
(15, 'Kevin', '12082004'),
(16, 'Sallé', '23091996'),
(17, 'Lounès', '03092004'),
(18, 'Enola', '15022004')]

for etudiant in etudiants:
    print("DROP USER IF EXISTS "+etudiant[1]+"@\'%\' ;")
    print("CREATE USER IF NOT EXISTS "+etudiant[1]+"@\'%\' IDENTIFIED BY \'"+etudiant[2]+"\';")  # Affiche le nom de l'étudiant
    print("GRANT SELECT, INSERT ON airline_dev.* TO '"+etudiant[1]+"'@\'%\';")

print ("FLUSH PRIVILEGES;")
