package org.example.springday4.Controller;

import org.example.springday4.Model.StudentModel;
import org.example.springday4.Service.StudentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("api/students")
public class StudentController {

        @Autowired
        StudentService service;

        @GetMapping("/s")
        public String display() {
            return "testing";
        }

        @GetMapping("/{id}")
        public ResponseEntity<StudentModel> getStudent(@PathVariable int id) {
            return service.getStudent(id);
        }

        @GetMapping("/search")
        public ResponseEntity<List<StudentModel>> getStudentByName(@RequestParam(defaultValue = "rahul") String name) {
            return service.getStudentByName(name.toLowerCase());
        }

        @GetMapping("/")
        public ResponseEntity<List<StudentModel>> getAllStudents() {
            return service.getAllStudents();
        }

        @PostMapping("/")
        public ResponseEntity<String> addStudent(@RequestBody StudentModel student) {
            return service.addStudent(student);
        }

        @PutMapping("/{id}")
        public ResponseEntity<String> updateStudent(@RequestBody StudentModel student, @PathVariable int id) {
            return service.updateStudent(student, id);
        }

        @DeleteMapping("/{id}")
        public ResponseEntity<String> deleteStudent(@PathVariable int id) {
            return service.deleteStudent(id);
        }
    }
