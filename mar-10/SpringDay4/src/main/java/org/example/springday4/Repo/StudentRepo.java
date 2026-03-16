package org.example.springday4.Repo;
import org.example.springday4.Model.StudentModel;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Repository
public class StudentRepo {
    List<StudentModel> students =new ArrayList<>();
    public StudentRepo(){
        students.add(new StudentModel(1, "Ramesh", 22));
        students.add(new StudentModel(2, "Raju", 21));
        students.add(new StudentModel(3, "Ankush", 23));
        students.add(new StudentModel(4, "Rishi", 21));
    }


    public ResponseEntity<StudentModel> getStudent(int id) {

        for(StudentModel i : students){
            if(i.getId() == id){
                return new ResponseEntity<>(i,HttpStatus.OK);
            }
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND );
    }

    public ResponseEntity<List<StudentModel>> getStudentByName(String name) {
        List<StudentModel> ans=new ArrayList<>();

        for(StudentModel i : students){
            if(i.getName().toLowerCase().equals(name)){

                ans.add(i);
            }
        }
        if(ans.isEmpty())
            return new ResponseEntity<>(HttpStatus.NOT_FOUND );
        else
            return new ResponseEntity<>(ans,HttpStatus.OK);
    }

    public ResponseEntity<List<StudentModel>> getAllStudents() {
        return new  ResponseEntity<>(students,HttpStatus.OK);
    }

    public ResponseEntity<String> addStudent(StudentModel student) {
        students.add(student);
        return new  ResponseEntity<>("Student added",HttpStatus.OK);
    }

    public ResponseEntity<String> deleteStudent(int id) {
        for(StudentModel i : students){
            if(i.getId()== id){
                students.remove(i);
                return new ResponseEntity<>("Student deleted Successfully",HttpStatus.OK);
            }
        }
        return new ResponseEntity<>("user not found", HttpStatus.NOT_FOUND);
    }
}
