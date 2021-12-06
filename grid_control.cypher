CREATE (m1:Magnet {name:"Magnet 1", power:50})
CREATE (m2:Magnet {name:"Magnet 2", power:250})
CREATE (m3:Magnet {name:"Magnet 3", power:450})
CREATE (m4:Magnet {name:"Magnet 4", power:650})
CREATE (m5:Magnet {name:"Magnet 5", power:850})
CREATE (m6:Magnet {name:"Magnet 6", power:1050})
CREATE (m7:Magnet {name:"Magnet 7", power:150})
CREATE (m8:Magnet {name:"Magnet 8", power:350})
CREATE (m9:Magnet {name:"Magnet 9", power:550})
CREATE (m10:Magnet {name:"Magnet 10", power:750})
CREATE (m11:Magnet {name:"Magnet 11", power:950})
CREATE (m12:Magnet {name:"Magnet 12", power:1150})

CREATE (grid:GRID {name:"Base"})
CREATE (p1:POWER {value:"50 watts"})
CREATE (p2:POWER {value:"150 watts"})
CREATE (p3:POWER {value:"250 watts"})
CREATE (p4:POWER {value:"350 watts"})
CREATE (p5:POWER {value:"450 watts"})
CREATE (p6:POWER {value:"550 watts"})
CREATE (p7:POWER {value:"650 watts"})
CREATE (p8:POWER {value:"750 watts"})
CREATE (p9:POWER {value:"850 watts"})
CREATE (p10:POWER {value:"950 watts"})
CREATE (p11:POWER {value:"1050 watts"})
CREATE (p12:POWER {value:"1150 watts"})

CREATE (startingMagnet:MAGNET)-[:STARTS_WITH]->(m1)
CREATE (endingMagnet:MAGNET)-[:ENDS_WITH]->(m12)

// NEIGHBORS
CREATE (m1)-[:NEIGHBOR_OF]->(m2)
CREATE (m2)-[:NEIGHBOR_OF]->(m1)

CREATE (m1)-[:NEIGHBOR_OF]->(m4)
CREATE (m4)-[:NEIGHBOR_OF]->(m1)

CREATE (m2)-[:NEIGHBOR_OF]->(m4)
CREATE (m4)-[:NEIGHBOR_OF]->(m2)

CREATE (m2)-[:NEIGHBOR_OF]->(m5)
CREATE (m5)-[:NEIGHBOR_OF]->(m2)

CREATE (m3)-[:NEIGHBOR_OF]->(m5)
CREATE (m5)-[:NEIGHBOR_OF]->(m3)

CREATE (m2)-[:NEIGHBOR_OF]->(m3)
CREATE (m3)-[:NEIGHBOR_OF]->(m2)

CREATE (m4)-[:NEIGHBOR_OF]->(m6)
CREATE (m6)-[:NEIGHBOR_OF]->(m4)

CREATE (m4)-[:NEIGHBOR_OF]->(m7)
CREATE (m7)-[:NEIGHBOR_OF]->(m4)

CREATE (m6)-[:NEIGHBOR_OF]->(m7)
CREATE (m7)-[:NEIGHBOR_OF]->(m6)

CREATE (m5)-[:NEIGHBOR_OF]->(m7)
CREATE (m7)-[:NEIGHBOR_OF]->(m5)

CREATE (m5)-[:NEIGHBOR_OF]->(m8)
CREATE (m8)-[:NEIGHBOR_OF]->(m5)

CREATE (m7)-[:NEIGHBOR_OF]->(m8)
CREATE (m8)-[:NEIGHBOR_OF]->(m7)

CREATE (m5)-[:NEIGHBOR_OF]->(m9)
CREATE (m9)-[:NEIGHBOR_OF]->(m5)

CREATE (m7)-[:NEIGHBOR_OF]->(m9)
CREATE (m9)-[:NEIGHBOR_OF]->(m7)

CREATE (m8)-[:NEIGHBOR_OF]->(m9)
CREATE (m9)-[:NEIGHBOR_OF]->(m8)

CREATE (m9)-[:NEIGHBOR_OF]->(m11)
CREATE (m11)-[:NEIGHBOR_OF]->(m9)

CREATE (m9)-[:NEIGHBOR_OF]->(m12)
CREATE (m12)-[:NEIGHBOR_OF]->(m9)

CREATE (m10)-[:NEIGHBOR_OF]->(m11)
CREATE (m11)-[:NEIGHBOR_OF]->(m10)

CREATE (m11)-[:NEIGHBOR_OF]->(m12)
CREATE (m12)-[:NEIGHBOR_OF]->(m11)

// CREATE (startingMagnet)-[:TRAVEL_TO*1..12]->(endingMagnet)

WITH m1, m12
MATCH path=(m1)-[:NEIGHBOR_OF*1..7]->(m12)
RETURN nodes(path), reduce(total = 0, tot IN nodes(path) | total + tot.power) AS totalPower
ORDER BY totalPower ASC
// LIMIT 1


// CALL apoc.neighbors.athop(m1, "NEIGHBOR_OF", 1)
// YIELD node
// RETURN node.name, MAX(node.power