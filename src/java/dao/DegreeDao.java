/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Degree;
import java.util.List;

/**
 *
 * @author PEEPO
 */
public interface DegreeDao {
    public void addDegree(Degree degree);
    public void updateDegree(Degree degree);
    public List<Degree> getAllDegree();
    public void delDegree(Degree degree);
    public void isDegree(String id);
}
