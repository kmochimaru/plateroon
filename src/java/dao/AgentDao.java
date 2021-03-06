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
    public List<Agent> getMemberByAgentCode(String agentId);
    public List<Agent> getAgentByAgentCode(String agentCode);
    public void updateAgent(Agent agent);
    public void updateApprove(String agentCode);
    public void updateUsernamePass(String username, String password, String agentCode);
    public void updateImg(String path, String name, String agentCode);
    public void delAgent(Agent agent);
    public boolean isValidLogin(String username, String password);
    public List<Agent> isValidAgentCode(String agentCode);
    public void updatePassword(String pass, String agentId);
    public boolean isValidIdCard(String idcard);
    public boolean isValidAgentId(String agent_id);
    public List<Agent> searchAgent(String amphur, String province);
}
