# CS374 Hotel Database Final Report
*Kenzie Rossiter, Sarah gerhart, Faz *

## ER Model
*insert the image here*
![conference review EER](./images/HW3_Revised.drawio.png)
*No Changes since HW 7*

## Relational Model
*insert the image(s) here*

- Conference Review System: ![conference review relational model](./images/HW_7_final.png)


*Describe any changes since HW7*

## Database creation
*Link the files here*

- Drop tables: [drop.sql](database/ref_drop_constraints.sql)
- Create tables: [create.sql](database/create_script.sql)
- Add constraints to tables: [alter.sql](database/refkeys.sql)

*They should be in a subdirectory called database*

*Describe any changes very briefly: for example:*

Sarah:
We added an occupant who is staying in the same room as a guest. Before, we had all guests staying in their own rooms with no occupant.

Kenzie:
Added a field to room_type called name
Added a field to reservations called room_type_name and then added a FK constraint that connect it to the room_type.  This was needed so customers can reserve a certain room type when they make their reservations.
Added room_type_name to the room_type_has_reservations table
Updated dbdiagram to match changes made


We changed the scripts to match updated model shown in previous section.

## Data
*Link the files here*

- Add some data from csv files: [load.sql](./data/load.sql)
     - [room.csv](./data/room.csv)
- Add some data from using Python and faker: [generate.py](./data/generate.py)

*They should be in a subdirectory called data*

*Describe any changes very briefly: for example:*

We changed the data to facilitate the queries, as described in the following sections.  We also changed how we loaded the data for X, Y and Z to using insert statements rather than `faker`.

## Queries

### Query 1
*Link the code file(s) here from subdirectory queries*

For example:
- [workshop_leader.py](./queries/workshop_leader.py)

*Describe the queries in detail with screenshots of the data setup and the results*

### Query 2
*Link the code file(s) here from subdirectory queries*
[query2-kenzie-pgadmin.sql](./queries/query2-kenzie-pgadmin.sql)

*Describe the queries in detail with screenshots of setup and results*
For this query, I selected the room numbers and room types.  To find the rooms that are double that are not yet occupied, I did a LEFT JOIN between the room_reservations table and the rooms table.  I then searched for rooms of type 'Double'.  I then was given a list of unoccupied double rooms.  I chose one of those rooms and wrote an insert query to assign Mrs. Smith her reserved double room.


### Query 3
*Link the code file(s) here from subdirectory queries*

*Describe the queries in detail with screenshots of setup and results*

### Query 4
*Link the code file(s) here from subdirectory queries*

*Describe the queries in detail with screenshots of setup and results*

### Query 5
*Link the code file(s) here from subdirectory queries*

*Describe the queries in detail with screenshots of setup and results*