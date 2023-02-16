CREATE TABLE Films(
	FilmID			INT				NOT NULL	PRIMARY KEY,
	Title			VARCHAR(50)	NOT NULL,
	Producer		VARCHAR(50)	NOT NULL,
	Director		VARCHAR(50)	NOT NULL,
	Released		DATE			NOT NULL,
	OpeningText		Text	NOT NULL
);


-- characters
CREATE TABLE People(
	PersonID		INT				NOT NULL PRIMARY KEY,
	Name			VARCHAR(100)	NOT NULL,
	HomePlanetID	INT				NULL,
	Gender			VARCHAR(15)	NULL,
	BirthYear		VARCHAR(15)	NULL,
	EyeColor		VARCHAR(20)	NULL,
	HairColor		VARCHAR(20)	NULL,
	SkinColor		VARCHAR(20)	NULL
);


-- planets
CREATE TABLE Planets(
	PlanetID		INT				NOT NULL PRIMARY KEY,
	Name			VARCHAR(20)	NOT NULL,
	Population	BIGINT			NULL,
	Diameter		INT				NULL,
	Climate			VARCHAR(25)	NULL,
	Terrain			VARCHAR(50)	NULL,
	Gravity			VARCHAR(50)	NULL,
	RotationPeriod	SMALLINT		NULL,
	OrbitalPeriod	SMALLINT		NULL
);


-- people2films
CREATE TABLE PeopleToFilms(
	PersonID		INT				NOT NULL,
	FilmID			INT				NOT NULL,
  PRIMARY KEY(PersonID,FilmID) 
);


-- planets2films
CREATE TABLE PlanetsToFilms(
	PlanetID		INT				NOT NULL,
	FilmID			INT				NOT NULL,
  PRIMARY KEY(PlanetID,FilmID) 
);



INSERT INTO Films (FilmID, Title, Producer, Director, Released, OpeningText) VALUES (1, 'The Phantom Menace', 'Rick McCallum', 'George Lucas', TO_DATE('1999-05-19','YYYY-MM-DD'), 'Turmoil has engulfed the
Galactic Republic. The taxation
of trade routes to outlying star
systems is in dispute.

Hoping to resolve the matter
with a blockade of deadly
battleships, the greedy Trade
Federation has stopped all
shipping to the small planet
of Naboo.

While the Congress of the
Republic endlessly debates
this alarming chain of events,
the Supreme Chancellor has
secretly dispatched two Jedi
Knights, the guardians of
peace and justice in the
galaxy, to settle the conflict....');

INSERT INTO Films (FilmID, Title, Producer, Director, Released, OpeningText) VALUES (2, 'Attack of the Clones', 'Rick McCallum', 'George Lucas', TO_DATE('2002-05-16','YYYY-MM-DD'), 'There is unrest in the Galactic
Senate. Several thousand solar
systems have declared their
intentions to leave the Republic.

This separatist movement,
under the leadership of the
mysterious Count Dooku, has
made it difficult for the limited
number of Jedi Knights to maintain 
peace and order in the galaxy.

Senator Amidala, the former
Queen of Naboo, is returning
to the Galactic Senate to vote
on the critical issue of creating
an ARMY OF THE REPUBLIC
to assist the overwhelmed
Jedi....');

INSERT INTO Films (FilmID, Title, Producer, Director, Released, OpeningText) VALUES (3, 'Revenge of the Sith', 'Rick McCallum', 'George Lucas', TO_DATE('2005-05-19','YYYY-MM-DD'), 'War! The Republic is crumbling
under attacks by the ruthless
Sith Lord, Count Dooku.
There are heroes on both sides.
Evil is everywhere.

In a stunning move, the
fiendish droid leader, General
Grievous, has swept into the
Republic capital and kidnapped
Chancellor Palpatine, leader of
the Galactic Senate.

As the Separatist Droid Army
attempts to flee the besieged
capital with their valuable
hostage, two Jedi Knights lead a
desperate mission to rescue the
captive Chancellor....');

INSERT INTO Films (FilmID, Title, Producer, Director, Released, OpeningText) VALUES (4, 'A New Hope', 'Gary Kurtz, Rick McCallum', 'George Lucas', TO_DATE('1977-05-25','YYYY-MM-DD'), 'It is a period of civil war.
Rebel spaceships, striking
from a hidden base, have won
their first victory against
the evil Galactic Empire.

During the battle, Rebel
spies managed to steal secret
plans to the Empire''s
ultimate weapon, the DEATH
STAR, an armored space
station with enough power
to destroy an entire planet.

Pursued by the Empire''s
sinister agents, Princess
Leia races home aboard her
starship, custodian of the
stolen plans that can save her
people and restore
freedom to the galaxy....');

INSERT INTO Films (FilmID, Title, Producer, Director, Released, OpeningText) VALUES (5, 'The Empire Strikes Back', 'Gary Kurtz, Rick McCallum', 'Irvin Kershner', TO_DATE('1980-05-17','YYYY-MM-DD'), 'It is a dark time for the
Rebellion. Although the Death
Star has been destroyed,
Imperial troops have driven the
Rebel forces from their hidden
base and pursued them across
the galaxy.

Evading the dreaded Imperial
Starfleet, a group of freedom
fighters led by Luke Skywalker
has established a new secret
base on the remote ice world
of Hoth.

The evil lord Darth Vader,
obsessed with finding young
Skywalker, has dispatched
thousands of remote probes into
the far reaches of space....');

INSERT INTO Films (FilmID, Title, Producer, Director, Released, OpeningText) VALUES (6, 'Return of the Jedi', 'Howard G. Kazanjian, George Lucas, Rick McCallum', 'Richard Marquand', TO_DATE('1983-05-25','YYYY-MM-DD'), 'Luke Skywalker has returned to
his home planet of Tatooine in
an attempt to rescue his
friend Han Solo from the
clutches of the vile gangster
Jabba the Hutt.

Little does Luke know that the
GALACTIC EMPIRE has secretly
begun construction on a new
armored space station even
more powerful than the first
dreaded Death Star.

When completed, this ultimate
weapon will spell certain doom
for the small band of rebels
struggling to restore freedom
to the galaxy...');

INSERT INTO Films (FilmID, Title, Producer, Director, Released, OpeningText) VALUES (7, 'The Force Awakens', 'Kathleen Kennedy, J. J. Abrams, Bryan Burk', 'J. J. Abrams', TO_DATE('2015-12-11','YYYY-MM-DD'), 'Luke Skywalker has vanished.
In his absence, the sinister
FIRST ORDER has risen from
the ashes of the Empire
and will not rest until
Skywalker, the last Jedi,
has been destroyed.
 
With the support of the
REPUBLIC, General Leia Organa
leads a brave RESISTANCE.
She is desperate to find her
brother Luke and gain his
help in restoring peace and
justice to the galaxy.
 
Leia has sent her most daring
pilot on a secret mission
to Jakku, where an old ally
has discovered a clue to
Luke''s whereabouts....');



INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (1, 'Luke Skywalker', '1', 'male', '19BBY', 'blue', 'blond', 'fair');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (2, 'C-3PO', '1', NULL, '112BBY', 'yellow', NULL, 'ld');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (3, 'R2-D2', '8', NULL, '33BBY', 'red', NULL, 'white, blue');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (4, 'Darth Vader', '1', 'male', '41.9BBY', 'yellow', NULL, 'white');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (5, 'Leia Organa', '2', 'female', '19BBY', 'brow', 'brow', 'light');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (6, 'Owen Lars', '1', 'male', '52BBY', 'blue', 'brown, grey', 'light');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (7, 'Beru Whitesun lars', '1', 'female', '47BBY', 'blue', 'brow', 'light');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (8, 'R5-D4', '1', NULL, NULL, 'red', NULL, 'white, red');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (9, 'Biggs Darklighter', '1', 'male', '24BBY', 'brow', 'black', 'light');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (10, 'Obi-Wan Kenobi', '20', 'male', '57BBY', 'blue-gray', 'auburn, white', 'fair');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (11, 'Anakin Skywalker', '1', 'male', '41.9BBY', 'blue', 'blond', 'fair');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (12, 'Wilhuff Tarki', '21', 'male', '64BBY', 'blue', 'auburn, grey', 'fair');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (13, 'Chewbacca', '14', 'male', '200BBY', 'blue', 'brow', 'unknow');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (14, 'Han Solo', '22', 'male', '29BBY', 'brow', 'brow', 'fair');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (15, 'Greedo', '23', 'male', '44BBY', 'black', NULL, 'gree');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (16, 'Jabba Desilijic Tiure', '24', 'hermaphrodite', '600BBY', 'orange', NULL, 'green-tan, brow');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (17, 'Wedge Antilles', '22', 'male', '21BBY', 'hazel', 'brow', 'fair');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (18, 'Jek Tono Porkins', '26', 'male', NULL, 'blue', 'brow', 'fair');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (19, 'Yoda', NULL, 'male', '896BBY', 'brow', 'white', 'gree');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (20, 'Palpatine', '8', 'male', '82BBY', 'yellow', 'grey', 'pale');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (21, 'Boba Fett', '10', 'male', '31.5BBY', 'brow', 'black', 'fair');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (22, 'IG-88', NULL, NULL, '15BBY', 'red', NULL, 'metal');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (23, 'Bossk', '29', 'male', '53BBY', 'red', NULL, 'gree');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (24, 'Lando Calrissia', '30', 'male', '31BBY', 'brow', 'black', 'dark');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (25, 'Lobot', '6', 'male', '37BBY', 'blue', NULL, 'light');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (26, 'Ackbar', '31', 'male', '41BBY', 'orange', NULL, 'brown mottle');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (27, 'Mon Mothma', '32', 'female', '48BBY', 'blue', 'aubur', 'fair');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (28, 'Arvel Crynyd', NULL, 'male', NULL, 'brow', 'brow', 'fair');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (29, 'Wicket Systri Warrick', '7', 'male', '8BBY', 'brow', 'brow', 'brow');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (30, 'Nien Nunb', '33', 'male', NULL, 'black', NULL, 'grey');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (31, 'Qui-n Jin', NULL, 'male', '92BBY', 'blue', 'brow', 'fair');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (32, 'Nute Gunray', '18', 'male', NULL, 'red', NULL, 'mottled gree');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (33, 'Finis Valorum', '9', 'male', '91BBY', 'blue', 'blond', 'fair');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (34, 'Padmé Amidala', '8', 'female', '46BBY', 'brow', 'brow', 'light');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (35, 'Jar Jar Binks', '8', 'male', '52BBY', 'orange', NULL, 'orange');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (36, 'Roos Tarpals', '8', 'male', NULL, 'orange', NULL, 'grey');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (37, 'Rur Nass', '8', 'male', NULL, 'orange', NULL, 'gree');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (38, 'Ric Olié', '8', 'male', NULL, 'blue', 'brow', 'fair');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (39, 'Watto', '34', 'male', NULL, 'yellow', 'black', 'blue, grey');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (40, 'Sebulba', '35', 'male', NULL, 'orange', NULL, 'grey, red');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (41, 'Quarsh Panaka', '8', 'male', '62BBY', 'brow', 'black', 'dark');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (42, 'Shmi Skywalker', '1', 'female', '72BBY', 'brow', 'black', 'fair');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (43, 'Darth Maul', '36', 'male', '54BBY', 'yellow', NULL, 'red');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (44, 'Bib Fortuna', '37', 'male', NULL, 'pink', NULL, 'pale');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (45, 'Ayla Secura', '37', 'female', '48BBY', 'hazel', NULL, 'blue');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (46, 'Ratts Tyerell', '38', 'male', NULL, 'unknow', NULL, 'grey, blue');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (47, 'Dud Bolt', '39', 'male', NULL, 'yellow', NULL, 'blue, grey');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (48, 'Gasgano', '40', 'male', NULL, 'black', NULL, 'white, blue');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (49, 'Ben Quadinaros', '41', 'male', NULL, 'orange', NULL, 'grey, green, yellow');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (50, 'Mace Windu', '42', 'male', '72BBY', 'brow', NULL, 'dark');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (51, 'Ki-Adi-Mundi', '43', 'male', '92BBY', 'yellow', 'white', 'pale');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (52, 'Kit Fisto', '44', 'male', NULL, 'black', NULL, 'gree');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (53, 'Eeth Koth', '45', 'male', NULL, 'brow', 'black', 'brow');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (54, 'Adi Gallia', '9', 'female', NULL, 'blue', NULL, 'dark');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (55, 'Saesee Tii', '47', 'male', NULL, 'orange', NULL, 'pale');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (56, 'Yarael Poof', '48', 'male', NULL, 'yellow', NULL, 'white');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (57, 'Plo Koo', '49', 'male', '22BBY', 'black', NULL, 'orange');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (58, 'Mas Amedda', '50', 'male', NULL, 'blue', NULL, 'blue');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (59, 'Gregar Typho', '8', 'male', NULL, 'brow', 'black', 'dark');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (60, 'Cordé', '8', 'female', NULL, 'brow', 'brow', 'light');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (61, 'Cliegg Lars', '1', 'male', '82BBY', 'blue', 'brow', 'fair');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (62, 'Poggle the Lesser', '11', 'male', NULL, 'yellow', NULL, 'gree');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (63, 'Luminara Unduli', '51', 'female', '58BBY', 'blue', 'black', 'yellow');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (64, 'Barriss Offee', '51', 'female', '40BBY', 'blue', 'black', 'yellow');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (65, 'Dormé', '8', 'female', NULL, 'brow', 'brow', 'light');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (66, 'Dooku', '52', 'male', '102BBY', 'brow', 'white', 'fair');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (67, 'Bail Prestor Organa', '2', 'male', '67BBY', 'brow', 'black', 'ta');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (68, 'Jan Fett', '53', 'male', '66BBY', 'brow', 'black', 'ta');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (69, 'Zam Wesell', '54', 'female', NULL, 'yellow', 'blonde', 'fair, green, yellow');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (70, 'Dexter Jettster', '55', 'male', NULL, 'yellow', NULL, 'brow');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (71, 'Lama Su', '10', 'male', NULL, 'black', NULL, 'grey');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (72, 'Taun We', '10', 'female', NULL, 'black', NULL, 'grey');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (73, 'Jocasta Nu', '9', 'female', NULL, 'blue', 'white', 'fair');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (74, 'R4-P17', NULL, 'female', NULL, 'red, blue', NULL, 'silver, red');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (75, 'Wat Tambor', '56', 'male', NULL, 'unknow', NULL, 'green, grey');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (76, 'San Hill', '57', 'male', NULL, 'ld', NULL, 'grey');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (77, 'Shaak Ti', '58', 'female', NULL, 'black', NULL, 'red, blue, white');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (78, 'Grievous', '59', 'male', NULL, 'green, yellow', NULL, 'brown, white');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (79, 'Tarfful', '14', 'male', NULL, 'blue', 'brow', 'brow');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (80, 'Raymus Antilles', '2', 'male', NULL, 'brow', 'brow', 'light');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (81, 'Sly Moore', '60', 'female', NULL, 'white', NULL, 'pale');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (82, 'Tion Medo', '12', 'male', NULL, 'black', NULL, 'grey');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (83, 'Fin', NULL, 'male', NULL, 'dark', 'black', 'dark');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (84, 'Rey', NULL, 'female', NULL, 'hazel', 'brow', 'light');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (85, 'Poe Damero', NULL, 'male', NULL, 'brow', 'brow', 'light');

INSERT INTO People (PersonID, Name, HomePlanetID, Gender, BirthYear, EyeColor, HairColor, SkinColor) VALUES (86, 'BB8', NULL, NULL, NULL, 'black', NULL, NULL);



INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (1, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (1, 4);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (1, 5);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (1, 6);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (1, 7);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (2, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (2, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (2, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (2, 4);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (2, 5);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (2, 6);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (3, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (3, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (3, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (3, 4);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (3, 5);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (3, 6);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (3, 7);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (4, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (4, 4);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (4, 5);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (4, 6);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (5, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (5, 4);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (5, 5);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (5, 6);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (5, 7);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (6, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (6, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (6, 4);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (7, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (7, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (7, 4);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (8, 4);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (9, 4);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (10, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (10, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (10, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (10, 4);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (10, 5);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (10, 6);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (11, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (11, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (11, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (12, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (12, 4);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (13, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (13, 4);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (13, 5);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (13, 6);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (13, 7);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (14, 4);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (14, 5);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (14, 6);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (14, 7);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (15, 4);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (16, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (16, 4);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (16, 6);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (17, 4);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (17, 5);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (17, 6);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (18, 4);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (19, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (19, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (19, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (19, 5);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (19, 6);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (20, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (20, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (20, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (20, 5);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (20, 6);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (21, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (21, 5);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (21, 6);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (22, 5);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (23, 5);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (24, 5);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (24, 6);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (25, 5);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (26, 6);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (26, 7);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (27, 6);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (28, 6);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (29, 6);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (30, 6);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (31, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (32, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (32, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (32, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (33, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (34, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (34, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (34, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (35, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (35, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (36, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (37, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (38, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (39, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (39, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (40, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (41, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (42, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (42, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (43, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (44, 6);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (45, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (45, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (45, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (46, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (47, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (48, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (49, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (50, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (50, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (50, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (51, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (51, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (51, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (52, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (52, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (52, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (53, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (53, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (54, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (54, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (55, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (55, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (56, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (57, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (57, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (57, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (58, 1);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (58, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (59, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (60, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (61, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (62, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (62, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (63, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (63, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (64, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (65, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (66, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (66, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (67, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (67, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (68, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (69, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (70, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (71, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (72, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (73, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (74, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (74, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (75, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (76, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (77, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (77, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (78, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (79, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (80, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (80, 4);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (81, 2);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (81, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (82, 3);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (83, 7);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (84, 7);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (85, 7);

INSERT INTO PeopleToFilms (PersonID, FilmID) VALUES (86, 7);



INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (1, 'Tatooine', 200000, 10465, 'arid', 'desert', '1 standard', 23, 304);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (2, 'Alderaa', 2000000000, 12500, 'temperate', 'grasslands, mountains', '1 standard', 24, 364);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (3, 'Yavin IV', 1000, 10200, 'temperate, tropical', 'jungle, rainforests', '1 standard', 24, 4818);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (4, 'Hoth', NULL, 7200, 'froze', 'tundra, ice caves, mountain ranges', '1.1 standard', 23, 549);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (5, 'Dabah', NULL, 8900, 'murky', 'swamp, jungles', NULL, 23, 341);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (6, 'Bespi', 6000000, 118000, 'temperate', 'gas giant', '1.5 (surface), 1 standard (Cloud City)', 12, 5110);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (7, 'Endor', 30000000, 4900, 'temperate', 'forests, mountains, lakes', '0.85 standard', 18, 402);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (8, 'Naboo', 4500000000, 12120, 'temperate', 'grassy hills, swamps, forests, mountains', '1 standard', 26, 312);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (9, 'Coruscant', 1000000000000, 12240, 'temperate', 'cityscape, mountains', '1 standard', 24, 368);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (10, 'Kamino', 1000000000, 19720, 'temperate', 'ocea', '1 standard', 27, 463);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (11, 'Geonosis', 100000000000, 11370, 'temperate, arid', 'rock, desert, mountain, barre', '0.9 standard', 30, 256);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (12, 'Utapau', 95000000, 12900, 'temperate, arid, windy', 'scrublands, savanna, canyons, sinkholes', '1 standard', 27, 351);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (13, 'Mustafar', 20000, 4200, 'hot', 'volcanoes, lava rivers, mountains, caves', '1 standard', 36, 412);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (14, 'Kashyyyk', 45000000, 12765, 'tropical', 'jungle, forests, lakes, rivers', '1 standard', 26, 381);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (15, 'Polis Massa', 1000000, NULL, 'artificial temperate ', 'airless asteroid', '0.56 standard', 24, 590);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (16, 'Mygeeto', 19000000, 10088, 'frigid', 'glaciers, mountains, ice canyons', '1 standard', 12, 167);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (17, 'Felucia', 8500000, 9100, 'hot, humid', 'fungus forests', '0.75 standard', 34, 231);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (18, 'Cato Neimoidia', 10000000, NULL, 'temperate, moist', 'mountains, fields, forests, rock arches', '1 standard', 25, 278);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (19, 'Saleucami', 1400000000, 14920, 'hot', 'caves, desert, mountains, volcanoes', NULL, 26, 392);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (20, 'Stewjo', NULL, NULL, 'temperate', 'grass', '1 standard', NULL, NULL);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (21, 'Eriadu', 22000000000, 13490, 'polluted', 'cityscape', '1 standard', 24, 360);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (22, 'Corellia', 3000000000, 11000, 'temperate', 'plains, urban, hills, forests', '1 standard', 25, 349);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (23, 'Rodia', 1300000000, 7549, 'hot', 'jungles, oceans, urban, swamps', '1 standard', 29, 305);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (24, 'Nal Hutta', 7000000000, 12150, 'temperate', 'urban, oceans, swamps, bogs', '1 standard', 87, 413);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (25, 'Dantooine', 1000, 9830, 'temperate', 'oceans, savannas, mountains, grasslands', '1 standard', 25, 378);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (26, 'Bestine IV', 62000000, 6400, 'temperate', 'rocky islands, oceans', NULL, 26, 680);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (27, 'Ord Mantell', 4000000000, 14050, 'temperate', 'plains, seas, mesas', '1 standard', 26, 334);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (29, 'Trandosha', 42000000, NULL, 'arid', 'mountains, seas, grasslands, deserts', '0.62 standard', 25, 371);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (30, 'Socorro', 300000000, NULL, 'arid', 'deserts, mountains', '1 standard', 20, 326);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (31, 'Mon Cala', 27000000000, 11030, 'temperate', 'oceans, reefs, islands', '1', 21, 398);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (32, 'Chandrila', 1200000000, 13500, 'temperate', 'plains, forests', '1', 20, 368);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (33, 'Sullust', 18500000000, 12780, 'superheated', 'mountains, volcanoes, rocky deserts', '1', 20, 263);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (34, 'Toydaria', 11000000, 7900, 'temperate', 'swamps, lakes', '1', 21, 184);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (35, 'Malastare', 2000000000, 18880, 'arid, temperate, tropical', 'swamps, deserts, jungles, mountains', '1.56', 26, 201);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (36, 'Dathomir', 5200, 10480, 'temperate', 'forests, deserts, savannas', '0.9', 24, 491);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (37, 'Ryloth', 1500000000, 10600, 'temperate, arid, subartic', 'mountains, valleys, deserts, tundra', '1', 30, 305);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (38, 'Aleen Minor', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (39, 'Vulpter', 421000000, 14900, 'temperate, artic', 'urban, barre', '1', 22, 391);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (40, 'Troike', NULL, NULL, NULL, 'desert, tundra, rainforests, mountains', NULL, NULL, NULL);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (41, 'Tund', NULL, 12190, NULL, 'barren, ash', NULL, 48, 1770);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (42, 'Haruun Kal', 705300, 10120, 'temperate', 'toxic cloudsea, plateaus, volcanoes', '0.98', 25, 383);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (43, 'Cerea', 450000000, NULL, 'temperate', 'verdant', '1', 27, 386);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (44, 'Glee Anselm', 500000000, 15600, 'tropical, temperate', 'lakes, islands, swamps, seas', '1', 33, 206);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (45, 'Iridonia', NULL, NULL, NULL, 'rocky canyons, acid pools', NULL, 29, 413);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (46, 'Tholoth', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (47, 'Iktotch', NULL, NULL, 'arid, rocky, windy', 'rocky', '1', 22, 481);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (48, 'Quermia', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (49, 'Dori', NULL, 13400, 'temperate', NULL, '1', 22, 409);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (50, 'Champala', 3500000000, NULL, 'temperate', 'oceans, rainforests, plateaus', '1', 27, 318);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (51, 'Mirial', NULL, NULL, NULL, 'deserts', NULL, NULL, NULL);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (52, 'Serenno', NULL, NULL, NULL, 'rainforests, rivers, mountains', NULL, NULL, NULL);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (53, 'Concord Daw', NULL, NULL, NULL, 'jungles, forests, deserts', NULL, NULL, NULL);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (54, 'Zola', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (55, 'Ojom', 500000000, NULL, 'frigid', 'oceans, glaciers', NULL, NULL, NULL);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (56, 'Skako', 500000000000, NULL, 'temperate', 'urban, vines', '1', 27, 384);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (57, 'Muunilinst', 5000000000, 13800, 'temperate', 'plains, forests, hills, mountains', '1', 28, 412);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (58, 'Shili', NULL, NULL, 'temperate', 'cities, savannahs, seas, plains', '1', NULL, NULL);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (59, 'Kalee', 4000000000, 13850, 'arid, temperate, tropical', 'rainforests, cliffs, canyons, seas', '1', 23, 378);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (60, 'Umbara', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO Planets (PlanetID, Name, Population, Diameter, Climate, Terrain, Gravity, RotationPeriod, OrbitalPeriod) VALUES (61, 'Jakku', NULL, NULL, NULL, 'deserts', NULL, NULL, NULL);



INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (1, 1);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (1, 2);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (1, 3);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (1, 4);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (1, 6);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (2, 3);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (2, 4);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (3, 4);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (4, 5);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (5, 3);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (5, 5);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (5, 6);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (6, 5);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (7, 6);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (8, 1);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (8, 2);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (8, 3);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (8, 6);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (9, 1);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (9, 2);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (9, 3);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (9, 6);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (10, 2);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (11, 2);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (12, 3);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (13, 3);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (14, 3);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (15, 3);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (16, 3);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (17, 3);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (18, 3);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (19, 3);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (27, 5);

INSERT INTO PlanetsToFilms (PlanetID, FilmID) VALUES (61, 7);

