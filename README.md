# robotics


# To start:

	docker build . -t robotics                                                     

	docker run -it -v /Users/user/git/robotics/workspaces:/workspaces:z robotics
  
	python3 /workspaces/workspace1/ws1_pkg/scripts/script.py &


# Verify up:

	ros2 node list

    ros2 topic list

   

# To stop:

   		fg

   		<Ctrl>+c
