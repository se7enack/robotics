# Robotics


#### to start:

	docker build . -t robotics                                                     

	docker run -it -v /Users/user/git/robotics/workspaces:/workspaces:z robotics
  
	python3 /workspaces/workspace1/ws1_pkg/scripts/publisher.py &


#### verify up:

	python3 /workspaces/workspace1/ws1_pkg/scripts/subscriber.py


#### check node and topic:

	ros2 node list
	
	ros2 topic list
	
	ros2 topic echo /hello_world
	

#### to stop:

	fg

	<Ctrl>+c
