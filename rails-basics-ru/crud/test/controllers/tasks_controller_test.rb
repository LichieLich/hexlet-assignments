require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  test 'shows task' do
    get task_path(tasks(:task))
    assert_response :success
    assert_select 'h1', 'Important task'
    assert_select 'span', text: "Status: #{tasks(:task).status}"
    assert_select 'p.incompleted', text: 'Incompleted', visible: true
  end

  test 'creates normal task' do
    post tasks_path, params: { task: { name: 'Created task', creator: 'Me', performer: 'Also me', 
    description: 'Yap, it is a task', completed: false, status: 'TO DO' } }
    
    assert_response :redirect
    follow_redirect!
    assert_response :success

    assert_select 'h1', 'Created task'
    assert_equal(2, Task.count)
  end

  test 'cannot create task without name' do
    post tasks_path, params: { task: { creator: 'Me', performer: 'Also me', 
      description: 'Yap, it is a task', completed: false, status: 'TO DO' } }
    assert_equal(1, Task.count)
  end

  test 'edits task' do
    put task_path(tasks(:task)), params: { task: { name: 'Created task', creator: 'Me', performer: 'Also me', 
    description: 'Yap, it is a task', completed: false, status: 'TO DO' } }
    
    t = Task.find(1)
    assert_equal('Created task', t.name)
    assert_equal('Me', t.creator)
    assert_equal('Also me', t.performer)
    assert_equal('Yap, it is a task', t.description)
    assert_equal(false, t.completed)
    assert_equal('TO DO', t.status)
  end

  test 'cannot edit without name' do
    put task_path(tasks(:task)), params: { task: { name: nil, creator: 'Me', performer: 'Also me', 
    description: 'Yap, it is a task', completed: false, status: 'TO DO' } }
    
    original_task = tasks(:task)
    t = Task.find(1)

    assert_equal(original_task.name, t.name)
    assert_equal(original_task.creator, t.creator)
    assert_equal(original_task.performer, t.performer)
    assert_equal(original_task.description, t.description)
    assert_equal(original_task.completed, t.completed)
    assert_equal(original_task.status, t.status)
  end

  test 'deletes task' do
    delete task_path(tasks(:task))
    assert_equal(0, Task.count)
  end
end
