import copy

def count_island(input_matrix):

    def add_padding(input_matrix):
        matrix = copy.deepcopy(input_matrix)
        for item in matrix:
            item.insert(0,0)
            item.append(0)
        matrix.insert(0, [0] * len(matrix[0]))
        matrix.append([0] * len(matrix[0]))
        return matrix

    input_matrix = add_padding(input_matrix)
    cols = len((input_matrix[0]))-1; rows = len((input_matrix))-1;
    island_list = []
    temp_list = []

    def dfs(i,j):
        stack = []
        
        if input_matrix[i][j] == 0:
            return 
        else:
            input_matrix[i][j] = 0
            stack.append((i,j))
            dfs(i-1, j) # up
            dfs(i+1, j) # down
            dfs(i, j-1) # left
            dfs(i, j+1) # right
        
        temp_list.append(stack.pop())
        return temp_list


    for i in range(1, rows):
        for j in range(1, cols):
            current_cell = input_matrix[i][j] 
            if current_cell == 1:
                island_list.append(dfs(i,j))
                temp_list = []
            else:
                pass
    return len(island_list)


if __name__ == "__main__":

    input_matrix_1 = [[1,1,1,1,0], 
                  [1,1,0,1,0], 
                  [1,1,0,0,0], 
                  [0,0,0,0,0]]

    input_matrix_2 = [[1,1,0,0,0],
                  [1,1,0,0,0],
                  [0,0,1,0,0],
                  [0,0,0,1,1]]

    print(count_island(input_matrix_1))
    print(count_island(input_matrix_2))

