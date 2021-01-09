require 'rails_helper'
 RSpec.describe 'task', type: :system do
  describe 'New Features'  do
    context 'case was the task to create a new'  do
      it ' task that you created is displayed '  do
     task=Task.create(name:" joshua", Details: "we are going out")
     visit task_path(task)
     expect(page).to have_content "joshua"
     expect(page).to have_content "we are going out"
    end
    end
  end
  describe 'list display function'  do
    context 'If the transition to the list screen'  do
      it 'already created task list is displayed' do
        visit new_task_path
        fill_in "Name", with: "Testing"
        fill_in "Details", with: "Testing again"
        click_button "Create Task"
        visit tasks_path
        expect(page).to have_content "Testing"
        expect(page).to have_content "Testing again"
      end
    end
  end
  describe 'detailed display function'  do
     context 'if the transition to any task detail screen'  do
       it 'should delete a task' do
        visit new_task_path
        fill_in "Name", with: "Testing"
        fill_in "Details", with: "Testing again"
        click_button "Create Task"
        visit tasks_path
        click_on 'Destroy'
        # expect(message).to have_content "Are you sure?"
        # click_on "OK"
        # expect(page).to have_content "Task was successfully destroyed."
        # accept_alert do
        # click_on "Destroy"
       end
     end
  end
  describe 'list display function'  do
    context 'If the transition to the list screen'  do
      it 'already created task list is displayed' do
        visit new_task_path
        fill_in "Name", with: "Testing"
        fill_in "Details", with: "Testing again"
        click_button "Create Task"
        visit tasks_path
        click_on 'Show'
        expect(page).to have_content "Testing"
        expect(page).to have_content "Testing again"
      end
    end
  end
  describe 'list display function'  do
    context 'If the transition to the list screen'  do
      it 'able to edit task' do
        task=Task.create(name: "joshua", Details: "we are going out")
        visit task_path(task.id)
        click_on 'Back'
        expect(page).to have_content "joshua"
        expect(page).to have_content "we are going out"
        end
      end
    end
  describe 'list display function'  do
    context 'If the transition to the list screen'  do
      it 'Updating task' do
        task=Task.create(name: "joshua", Details: "we are going out")
        visit tasks_path
        click_on 'Edit'
        click_button "Update Task"
        expect(page).to have_content 'Task was successfully updated.'
      end
    end
  end
 describe 'list display function' do
    context 'When tasks are arranged in descending order of creation and time'do
      it 'new task is displayed on top' do
      task=Task.create(name: "joshua", Details: "we are going out")
      visit tasks_path
      tasks = Task.all.order("created_at DESC")
   end
  end
 end
 describe 'detailed display function'  do
     context 'if the transition to any task detail screen'  do
       it 'Register task and sort with Deadline' do
        visit new_task_path
        fill_in "Name", with: "Try"
        fill_in "Details", with: "Testing"
        fill_in "Deadline", with: "2021/1/4"
        click_button "Create Task"
        visit tasks_path
        click_on 'Deadline'
        tasks=Task.all.order("Deadline DESC")
      end
     end
   end
   describe 'detailed display function'  do
      context 'if the transition to any task detail screen'  do
        it 'display task with status' do
         visit new_task_path
         fill_in "Name", with: "life"
         fill_in "Details", with: "schooling"
         fill_in "Deadline", with: "2021/1/9"
         fill_in 'task[status]', with: "in progress"
         click_button "Create Task"
         expect(page).to have_content 'Task was successfully created.'

       end
      end
    end

    describe 'detailed display function'  do
       context 'if the transition to any task detail screen'  do
         it 'display task with priority' do
          visit new_task_path
          fill_in "Name", with: "Happy"
          fill_in "Details", with: "school"
          fill_in "Deadline", with: "2021/3/9"
          fill_in "task_status", with: "in progress"
          fill_in "task_priority", with: "medium"
          click_button "Create Task"
          expect(page).to have_content 'Task was successfully created.'
        end
       end
     end
     describe 'detailed display function'  do
        context 'if the transition to any task detail screen'  do
          it 'search by status' do
           visit new_task_path
           fill_in "Name", with: "Happy"
           fill_in "Details", with: "school"
           fill_in "Deadline", with: "2021/3/9"
           fill_in "task_status", with: "in progress"
           fill_in "task_priority", with: "medium"
           click_button "Create Task"
           visit tasks_path
           fill_in 'Status', with: "in progress"
           click_on "Search"
           expect(page).to have_content 'in progress'
         end
        end
      end

      describe 'detailed display function'  do
         context 'if the transition to any task detail screen'  do
           it 'search by name' do
            visit new_task_path
            fill_in "Name", with: "Honeybee"
            fill_in "Details", with: "schools"
            fill_in "Deadline", with: "2021/3/19"
            fill_in "task_status", with: "in progress"
            fill_in "task_priority", with: "medium"
            click_button "Create Task"
            visit tasks_path
            fill_in 'Name', with: "Honeybee"
            click_on "Search"
            expect(page).to have_content 'Honeybee'
          end
         end
       end
       describe 'detailed display function'  do
          context 'if the transition to any task detail screen'  do
            it 'search by both name and status' do
             visit new_task_path
             fill_in "Name", with: "Tokyo"
             fill_in "Details", with: "Japan"
             fill_in "Deadline", with: "2021/3/19"
             fill_in "task_status", with: "completed"
             fill_in "task_priority", with: "medium"
             click_button "Create Task"
             visit tasks_path
             fill_in 'Name', with: "Tokyo"
             fill_in 'Status', with: "completed"
             click_on "Search"
             expect(page).to have_content 'Tokyo'
             expect(page).to have_content 'completed'
           end
          end
        end

 end
