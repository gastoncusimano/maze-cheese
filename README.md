# The Cheese Maze
Given a **maze** (2D array), **source point** (mouse position) and **destination** (cheese position). Find the path and return it.  
Here I learned about DFS & BFS. This was a test for Lemontech time ago. (Info below)

So I created a Ruby Class that allows not only to find the path, but also give you a visual representation if you want it. You can choose to use DFS or BFS.

## The basics
You can modify the file with your maze and/or source and destination.
![image](https://user-images.githubusercontent.com/50880563/224426328-31f7632b-404d-44fd-8b3b-167ec8f4d8cf.png)

You can try it like this:  
```ruby
TheCheeseMaze.new(maze: $maze, mouse_pos: $mouse_pos, cheese_pos: $cheese_pos).solve
```
This way you only see the path as coords array. You can visualize the maze passing **visual: true** and also find the shortest path sending **shortest_path: true** to the call like this:
```ruby
TheCheeseMaze.new(maze: $maze, mouse_pos: $mouse_pos, cheese_pos: $cheese_pos).solve(shortest_path: true, visual: true)
```
## Output using the data above with BFS (shortest_path: true)
![image](https://user-images.githubusercontent.com/50880563/224427703-e2d26237-ae54-4f22-9cd7-b46b05696c17.png)

## Output using the data above with DFS (shortest_path: false)
![image](https://user-images.githubusercontent.com/50880563/224427822-35475ed2-eddd-4d9c-b7b8-e34940ec3278.png)

# Little research
DFS (Deep First Search) and BFS (Breadth First Search) are two common graph traversal algorithms. The main differences between the two are:
1. DFS explores a graph by visiting a node and then recursively exploring as far as possible along each branch before backtracing. BFS, on the other hand, explores every possible at a given depth before moving deeper.
2. Memory usage: DFS usually uses less memory than BFS cause it only needs to store info about the current path instead of keeping track of all nodes at a given depth as BFS does.

## BFS
![image](https://user-images.githubusercontent.com/50880563/224425477-8bf63a56-7f57-4740-94cd-937ca24fc9d6.png)

  
## DFS
![image](https://user-images.githubusercontent.com/50880563/224425520-0a3b0643-4c68-4814-afc2-33bc19794b13.png)
