-- Make sure to attach design image/pdf in the same folder.
-- Write your DDL queries here.

// Use DBML to define your database structure
// Docs: https://dbml.dbdiagram.io/docs

Table users {
  user_id integer [primary key]
  username varchar
  role BOOLEAN 
  name varchar
}


Table Skills {
  skill_id integer [primary key]
  creator_id integer 
  skill varchar
}

Table Demos {
  demo_id integer [primary key]
  creator_id integer
  skill_id integer
  demo_type varchar
  demo_path varchar
}

Table Categories {
  category_id integer [primary key]
  category_name varchar
}

TABLE creator_Skills {
    creator_id integer
    skill_id integer
}

Table Projects {
  project_id integer [primary key]
  client_id integer 
  project_name varchar
  project_description varchar
}

Table ProjectMaterials {
  material_id integer [primary key]
  project_id integer 
  material_type varchar
  path varchar
}

TABLE Assignments {
  assignment_id integer [primary key]
  project_id integer 
  creator_id integer 
  status BOOLEAN
  deadline date
}

Table AssignmentMaterials {
  assigment_material_id integer [primary key]
  assignment_id integer 
  material_type varchar
  path varchar
}
TABLE Communications {
  communication_id INT [PRIMARY KEY]
  assignment_id INT
  sender_id INT
  receiver_id INT
  message TEXT
  sent_at TIMESTAMP
  is_read BOOLEAN 
}


Ref: "users"."user_id" < "creator_Skills"."creator_id"

Ref: "users"."user_id" < "Projects"."client_id"

Ref: "Projects"."project_id" < "ProjectMaterials"."project_id"

Ref: "users"."user_id" < "Assignments"."creator_id"

Ref: "Assignments"."assignment_id" < "Communications"."assignment_id"

Ref: "Categories"."category_name" < "Skills"."skill"

Ref: "Skills"."skill_id" < "Demos"."skill_id"

Ref: "Skills"."skill_id" < "creator_Skills"."skill_id"

Ref: "users"."user_id" < "Skills"."creator_id"

Ref: "users"."user_id" < "Demos"."creator_id"

Ref: "users"."user_id" < "Communications"."sender_id"

Ref: "users"."user_id" < "Communications"."receiver_id"

Ref: "Assignments"."assignment_id" < "AssignmentMaterials"."assignment_id"

Ref: "Projects"."project_id" < "Assignments"."project_id"