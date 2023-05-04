# Robotics


#### to start:

	docker build . -t robotics                                                     

	docker run -it -v /Users/user/git/robotics/workspaces:/workspaces:z robotics
  
	python3 /workspaces/workspace1/ws1_pkg/scripts/script.py &


#### verify up:

	ros2 node list
	
	ros2 topic list

   

#### to stop:

	fg

	<Ctrl>+c
