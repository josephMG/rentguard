module AgentsHelper
  def setup_contact(agent)
    agent.build_contact unless agent.contact
    agent
  end
end
