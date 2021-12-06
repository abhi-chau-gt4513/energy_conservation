CREATE (t1:Tile)
CREATE (t2:Tile)
CREATE (t3:Tile)
CREATE (t4:Tile)
CREATE (t5:Tile)
CREATE (t6:Tile)
CREATE (t7:Tile)
CREATE (t8:Tile)
CREATE (t9:Tile)
CREATE (t10:Tile)
CREATE (t11:Tile)
CREATE (t12:Tile)

(grid:GRID)
(p:POWER)


CREATE  (t1:Tile)-[:GENERATES]->(p)

MATCH   (t1:Tile)-[:GENERATES]-(p)

RETURN  t1

// CREATE (grid)-[:CONTAINS]->(m1)
// CREATE (grid)-[:CONTAINS]->(m2)
// CREATE (grid)-[:CONTAINS]->(m3)
// CREATE (grid)-[:CONTAINS]->(m4)
// CREATE (grid)-[:CONTAINS]->(m5)
// CREATE (grid)-[:CONTAINS]->(m6)
// CREATE (grid)-[:CONTAINS]->(m7)
// CREATE (grid)-[:CONTAINS]->(m8)
// CREATE (grid)-[:CONTAINS]->(m9)
// CREATE (grid)-[:CONTAINS]->(m10)
// CREATE (grid)-[:CONTAINS]->(m11)
// CREATE (grid)-[:CONTAINS]->(m12)