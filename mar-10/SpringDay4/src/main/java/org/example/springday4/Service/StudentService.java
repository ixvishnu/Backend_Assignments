package org.example.springday4.Service;

import org.example.springday4.Model.StudentModel;
import org.example.springday4.Repo.StudentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {
    @Autowired
    StudentRepo repo;

    public ResponseEntity<StudentModel> getStudent(int id) {
        return repo.getStudent(id);

    }

    public ResponseEntity<List<StudentModel>> getStudentByName(String name) {
        return repo.getStudentByName(name);
    }

    public ResponseEntity<List<StudentModel>> getAllStudents() {
        return repo.getAllStudents();
    }

    public ResponseEntity<String> addStudent(StudentModel student) {
        return repo.addStudent(student);
    }

    public ResponseEntity<String> deleteStudent(int id){
        return repo.deleteStudent(id);
    }

    public ResponseEntity<String> updateStudent(StudentModel student, int id) {

        if(repo.deleteStudent(id).getStatusCode() == HttpStatus.NOT_FOUND){
            return new ResponseEntity<>("user not found ",HttpStatus.NOT_FOUND);
        }

        repo.addStudent(student);

        return new ResponseEntity<>("Student Updated",HttpStatus.OK);


    }
}