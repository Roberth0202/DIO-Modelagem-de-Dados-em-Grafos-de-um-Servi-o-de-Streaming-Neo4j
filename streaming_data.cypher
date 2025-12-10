//CONSTRAINTS (Restrições): Eles são regras de segurança que você obriga o banco de dados a seguir.
//UNIQUE: Garante que nunca existam dois nós com o mesmo valor naquela propriedade.
//IF NOT EXISTS: Isso diz ao banco: "Só crie essa regra se ela ainda não existir."
//REQUIRE: é a "ordem" propriamente dita. É o verbo que liga o Alvo à Regra.
CREATE CONSTRAINT user_id IF NOT EXISTS FOR (u:User) REQUIRE u.userId IS UNIQUE;
CREATE CONSTRAINT actor_id IF NOT EXISTS FOR (a:Actor) REQUIRE a.actorId IS UNIQUE;
CREATE CONSTRAINT director_id IF NOT EXISTS FOR (d:Director) REQUIRE d.directorId IS UNIQUE;

CREATE CONSTRAINT movie_id IF NOT EXISTS FOR (m:Movie) REQUIRE m.movieId IS UNIQUE;
CREATE CONSTRAINT series_id IF NOT EXISTS FOR (s:Series) REQUIRE s.seriesId IS UNIQUE;

CREATE CONSTRAINT genre_name IF NOT EXISTS FOR (g:Genre) REQUIRE g.name IS UNIQUE;

//UNWIND: Você define a lista de textos.
//AS genre_name: Você dá um nome temporário para cada item da lista (como o i em um for i in list).
UNWIND ["Sci-Fi", "Ação", "Drama", "Comédia", "Fantasia", "Crime", "Animação", "Família", "Suspense", "Terror"] AS genre_name
//MERGE GARANTE QUE O NÓ SEJA CRIADO, CASO NÃO EXISTA
MERGE (g:Genre {name:genre_name});

//==================================
//Usario
//==================================
MERGE (u1:User {userId: "01", name: "Ana Souza"});
MERGE (u2:User {userId: "02", name: "Bruno Lima"});
MERGE (u3:User {userId: "03", name: "Carlos Mendes"});
MERGE (u4:User {userId: "04", name: "Daniela Oliveira"});
MERGE (u5:User {userId: "05", name: "Eduardo Silva"});
MERGE (u6:User {userId: "06", name: "Fernanda Costa"});
MERGE (u7:User {userId: "07", name: "Gabriel Santos"});
MERGE (u8:User {userId: "08", name: "Helena Rocha"});
MERGE (u9:User {userId: "09", name: "Igor Martins"});
MERGE (u10:User {userId: "10", name: "Julia Pereira"});

//=====================================
//Actor
//=====================================
MERGE (a1:Actor {actorId: "101", name: "Leonardo DiCaprio"});
MERGE (a2:Actor {actorId: "102", name: "Robert Downey Jr."});
MERGE (a3:Actor {actorId: "103", name: "Scarlett Johansson"});
MERGE (a4:Actor {actorId: "104", name: "Samuel L. Jackson"});
MERGE (a5:Actor {actorId: "105", name: "Tom Hanks"});
MERGE (a6:Actor {actorId: "106", name: "Brad Pitt"});
MERGE (a7:Actor {actorId: "107", name: "Johnny Depp"});
MERGE (a8:Actor {actorId: "108", name: "Morgan Freeman"});
MERGE (a9:Actor {actorId: "109", name: "Al Pacino"});
MERGE (a10:Actor {actorId: "110", name: "Keanu Reeves"});

//===========================================
//Director
//===========================================
MERGE (d1:Director {directorId: "201", name: "Steven Spielberg"});
MERGE (d2:Director {directorId: "202", name: "Christopher Nolan"});
MERGE (d3:Director {directorId: "203", name: "Quentin Tarantino"});
MERGE (d4:Director {directorId: "204", name: "James Cameron"});
MERGE (d5:Director {directorId: "205", name: "Martin Scorsese"});
MERGE (d6:Director {directorId: "206", name: "Francis Ford Coppola"});
MERGE (d7:Director {directorId: "207", name: "David Fincher"});
MERGE (d8:Director {directorId: "208", name: "George Lucas"});
MERGE (d9:Director {directorId: "209", name: "Peter Jackson"});
MERGE (d10:Director {directorId: "210", name: "Ridley Scott"});

// ==========================================
// Filme
// ==========================================
MERGE (m1:Movie {movieId: "301", title: "Avatar", year: 2009});
MERGE (m2:Movie {movieId: "302", title: "Avengers: Endgame", year: 2019});
MERGE (m3:Movie {movieId: "303", title: "Titanic", year: 1997});
MERGE (m4:Movie {movieId: "304", title: "Star Wars: A New Hope", year: 1977});
MERGE (m5:Movie {movieId: "305", title: "The Godfather", year: 1972});
MERGE (m6:Movie {movieId: "306", title: "Pulp Fiction", year: 1994});
MERGE (m7:Movie {movieId: "307", title: "The Dark Knight", year: 2008});
MERGE (m8:Movie {movieId: "308", title: "Fight Club", year: 1999});
MERGE (m9:Movie {movieId: "309", title: "Forrest Gump", year: 1994});
MERGE (m10:Movie {movieId: "310", title: "The Matrix", year: 1999});

// ==========================================
// Series
// ==========================================
MERGE (s1:Series {seriesId: "401", title: "Breaking Bad", year: 2008});
MERGE (s2:Series {seriesId: "402", title: "Game of Thrones", year: 2011});
MERGE (s3:Series {seriesId: "403", title: "Band of Brothers", year: 2001});
MERGE (s4:Series {seriesId: "404", title: "Friends", year: 1994});
MERGE (s5:Series {seriesId: "405", title: "Mindhunter", year: 2017});
MERGE (s6:Series {seriesId: "406", title: "Boardwalk Empire", year: 2010});
MERGE (s7:Series {seriesId: "407", title: "Agents of S.H.I.E.L.D.", year: 2013});
MERGE (s8:Series {seriesId: "408", title: "Hunters", year: 2020});
MERGE (s9:Series {seriesId: "409", title: "21 Jump Street", year: 1987});
MERGE (s10:Series {seriesId: "410", title: "Raised by Wolves", year: 2020});

// ==========================================
// 4. RELACIONAMENTOS: QUEM ASSISTIU O QUÊ
// ==========================================
MATCH (u:User {userId: "01"}), (m:Movie {moviesId: "301"}) MERGE (u)-[:WATCHED {rating:5}]->(m);
MATCH (u:User {userId: "01"}), (s:Series {seriesId: "401"}) MERGE (u)-[:WATCHED {rating:5}]->(s);

MATCH (u:User {userId: "02"}), (m:Movie {movieId: "302"}) MERGE (u)-[:WATCHED {rating:7}]->(m);
MATCH (u:User {userId: "02"}), (s:Series {seriesId: "402"}) MERGE (u)-[:WATCHED {rating:5}]->(s);

MATCH (u:User {userId: "03"}), (m:Movie {movieId: "303"}) MERGE (u)-[:WATCHED {rating:6}]->(m);
MATCH (u:User {userId: "03"}), (s:Series {seriesId: "403"}) MERGE (u)-[:WATCHED {rating:5}]->(s);

MATCH (u:User {userId: "04"}), (m:Movie {movieId: "304"}) MERGE (u)-[:WATCHED {rating:3}]->(m);
MATCH (u:User {userId: "04"}), (s:Series {seriesId: "404"}) MERGE (u)-[:WATCHED {rating:5}]->(s);

MATCH (u:User {userId: "05"}), (m:Movie {movieId: "305"}) MERGE (u)-[:WATCHED {rating:9}]->(m);
MATCH (u:User {userId: "05"}), (s:Series {seriesId: "405"}) MERGE (u)-[:WATCHED {rating:5}]->(s);

MATCH (u:User {userId: "06"}), (m:Movie {movieId: "306"}) MERGE (u)-[:WATCHED {rating:8}]->(m);
MATCH (u:User {userId: "06"}), (s:Series {seriesId: "406"}) MERGE (u)-[:WATCHED {rating:5}]->(s);

MATCH (u:User {userId: "07"}), (m:Movie {movieId: "307"}) MERGE (u)-[:WATCHED {rating:4}]->(m);
MATCH (u:User {userId: "07"}), (s:Series {seriesId: "407"}) MERGE (u)-[:WATCHED {rating:5}]->(s);

MATCH (u:User {userId: "08"}), (m:Movie {movieId: "308"}) MERGE (u)-[:WATCHED {rating:10}]->(m);
MATCH (u:User {userId: "08"}), (s:Series {seriesId: "408"}) MERGE (u)-[:WATCHED {rating:5}]->(s);

MATCH (u:User {userId: "09"}), (m:Movie {movieId: "309"}) MERGE (u)-[:WATCHED {rating:2}]->(m);
MATCH (u:User {userId: "09"}), (s:Series {seriesId: "409"}) MERGE (u)-[:WATCHED {rating:5}]->(s);

MATCH (u:User {userId: "10"}), (m:Movie {movieId: "310"}) MERGE (u)-[:WATCHED {rating:10}]->(m);
MATCH (u:User {userId: "10"}), (s:Series {seriesId: "410"}) MERGE (u)-[:WATCHED {rating:5}]->(s);

// ==========================================
// 5. RELACIONAMENTOS: FILME/SÉRIE -> GÊNERO
// ==========================================
// MATCH Filmes -> Genero
MATCH (m:Movie {movieId: "301"}), (g:Genre {name: "Sci-Fi"}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {movieId: "302"}), (g:Genre {name: "Ação"}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {movieId: "303"}), (g:Genre {name: "Drama"}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {movieId: "304"}), (g:Genre {name: "Sci-Fi"}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {movieId: "305"}), (g:Genre {name: "Crime"}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {movieId: "306"}), (g:Genre {name: "Crime"}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {movieId: "307"}), (g:Genre {name: "Ação"}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {movieId: "308"}), (g:Genre {name: "Drama"}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {movieId: "309"}), (g:Genre {name: "Drama"}) MERGE (m)-[:IN_GENRE]->(g);
MATCH (m:Movie {movieId: "310"}), (g:Genre {name: "Sci-Fi"}) MERGE (m)-[:IN_GENRE]->(g);

// MATCH Séries -> genero
MATCH (s:Series {seriesId: "401"}), (g:Genre {name: "Crime"}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {seriesId: "402"}), (g:Genre {name: "Fantasia"}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {seriesId: "403"}), (g:Genre {name: "Ação"}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {seriesId: "404"}), (g:Genre {name: "Comédia"}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {seriesId: "405"}), (g:Genre {name: "Suspense"}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {seriesId: "406"}), (g:Genre {name: "Drama"}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {seriesId: "407"}), (g:Genre {name: "Sci-Fi"}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {seriesId: "408"}), (g:Genre {name: "Drama"}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {seriesId: "409"}), (g:Genre {name: "Crime"}) MERGE (s)-[:IN_GENRE]->(g);
MATCH (s:Series {seriesId: "410"}), (g:Genre {name: "Sci-Fi"}) MERGE (s)-[:IN_GENRE]->(g);

// ==========================================
// 6. ATORES EM FILMES [:ACTED_IN]
// ==========================================

// Leonardo DiCaprio (101) em Titanic (303)
MATCH (a:Actor {actorId: "101"}), (m:Movie {movieId: "303"}) MERGE (a)-[:ACTED_IN]->(m);

// Robert Downey Jr (102) em Avengers (302)
MATCH (a:Actor {actorId: "102"}), (m:Movie {movieId: "302"}) MERGE (a)-[:ACTED_IN]->(m);

// Scarlett Johansson (103) em Avengers (302)
MATCH (a:Actor {actorId: "103"}), (m:Movie {movieId: "302"}) MERGE (a)-[:ACTED_IN]->(m);

// Samuel L. Jackson (104) em Pulp Fiction (306) e Avengers (302)
MATCH (a:Actor {actorId: "104"}), (m:Movie {movieId: "306"}) MERGE (a)-[:ACTED_IN]->(m);
MATCH (a:Actor {actorId: "104"}), (m:Movie {movieId: "302"}) MERGE (a)-[:ACTED_IN]->(m);

// Tom Hanks (105) em Forrest Gump (309)
MATCH (a:Actor {actorId: "105"}), (m:Movie {movieId: "309"}) MERGE (a)-[:ACTED_IN]->(m);

// Brad Pitt (106) em Fight Club (308)
MATCH (a:Actor {actorId: "106"}), (m:Movie {movieId: "308"}) MERGE (a)-[:ACTED_IN]->(m);

// Morgan Freeman (108) em Dark Knight (307)
MATCH (a:Actor {actorId: "108"}), (m:Movie {movieId: "307"}) MERGE (a)-[:ACTED_IN]->(m);

// Al Pacino (109) em O Poderoso Chefão (305)
MATCH (a:Actor {actorId: "109"}), (m:Movie {movieId: "305"}) MERGE (a)-[:ACTED_IN]->(m);

// Keanu Reeves (110) em Matrix (310)
MATCH (a:Actor {actorId: "110"}), (m:Movie {movieId: "310"}) MERGE (a)-[:ACTED_IN]->(m);


// ==========================================
// 7. DIRETORES EM FILMES [:DIRECTED]
// ==========================================

// Christopher Nolan (202) dirigiu Dark Knight (307)
MATCH (d:Director {directorId: "202"}), (m:Movie {movieId: "307"}) MERGE (d)-[:DIRECTED]->(m);

// Quentin Tarantino (203) dirigiu Pulp Fiction (306)
MATCH (d:Director {directorId: "203"}), (m:Movie {movieId: "306"}) MERGE (d)-[:DIRECTED]->(m);

// James Cameron (204) dirigiu Avatar (301) e Titanic (303)
MATCH (d:Director {directorId: "204"}), (m:Movie {movieId: "301"}) MERGE (d)-[:DIRECTED]->(m);
MATCH (d:Director {directorId: "204"}), (m:Movie {movieId: "303"}) MERGE (d)-[:DIRECTED]->(m);

// Francis Ford Coppola (206) dirigiu O Poderoso Chefão (305)
MATCH (d:Director {directorId: "206"}), (m:Movie {movieId: "305"}) MERGE (d)-[:DIRECTED]->(m);

// David Fincher (207) dirigiu Fight Club (308)
MATCH (d:Director {directorId: "207"}), (m:Movie {movieId: "308"}) MERGE (d)-[:DIRECTED]->(m);

// George Lucas (208) dirigiu Star Wars (304)
MATCH (d:Director {directorId: "208"}), (m:Movie {movieId: "304"}) MERGE (d)-[:DIRECTED]->(m);


// ==========================================
// 8. ATORES EM SÉRIES [:ACTED_IN]
// ==========================================

// Samuel L. Jackson (104) em Agents of SHIELD (407)
MATCH (a:Actor {actorId: "104"}), (s:Series {seriesId: "407"}) MERGE (a)-[:ACTED_IN]->(s);

// Brad Pitt (106) em Friends (404) 
MATCH (a:Actor {actorId: "106"}), (s:Series {seriesId: "404"}) MERGE (a)-[:ACTED_IN]->(s);

// Johnny Depp (107) em 21 Jump Street (409) 
MATCH (a:Actor {actorId: "107"}), (s:Series {seriesId: "409"}) MERGE (a)-[:ACTED_IN]->(s);

// Al Pacino (109) em Hunters (408)
MATCH (a:Actor {actorId: "109"}), (s:Series {seriesId: "408"}) MERGE (a)-[:ACTED_IN]->(s);

// Tom Hanks (105) em Band of Brothers (403)
MATCH (a:Actor {actorId: "105"}), (s:Series {seriesId: "403"}) MERGE (a)-[:ACTED_IN]->(s);


// ==========================================
// 9. DIRETORES EM SÉRIES [:DIRECTED]
// ==========================================

// Steven Spielberg (201) produziu/dirigiu Band of Brothers (403)
MATCH (d:Director {directorId: "201"}), (s:Series {seriesId: "403"}) MERGE (d)-[:DIRECTED]->(s);

// Martin Scorsese (205) dirigiu Boardwalk Empire (406)
MATCH (d:Director {directorId: "205"}), (s:Series {seriesId: "406"}) MERGE (d)-[:DIRECTED]->(s);

// David Fincher (207) dirigiu Mindhunter (405)
MATCH (d:Director {directorId: "207"}), (s:Series {seriesId: "405"}) MERGE (d)-[:DIRECTED]->(s);

// Ridley Scott (210) dirigiu Raised by Wolves (410)
MATCH (d:Director {directorId: "210"}), (s:Series {seriesId: "410"}) MERGE (d)-[:DIRECTED]->(s);