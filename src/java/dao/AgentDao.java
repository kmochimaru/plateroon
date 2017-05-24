/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Agent;
import java.util.List;

/**
 *
 * @author PEEPO
 */
public interface AgentDao {
    public void addAgent(Agent agent);
    public List<Agent> getAllAgent();
    public List<Agent> getAgentByActiveN();
    public List<Agent> getAgentByActiveY();
    public List<Agent> getAgentById(String id);
    public List<Agent> getAgentByUsername(String username);
    public void updateAgent(Agent agent);
    public void updateApprove(String agent_id);
    public void delAgent(Agent agent);
    public boolean isValidLogin(String username, String password);
    public void updatePassword(String pass, String agentId);
    public boolean isValidIdCard(String idcard);
    public boolean isValidAgentId(String agent_id);
}
