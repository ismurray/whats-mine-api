class MoveBoxRefsToUsersBoxes < ActiveRecord::Migration[5.1]
  # copies all existing box references from the Boxes table, and copies them
  # into the new join table UsersBoxes
  def copy_box_data
    existing_users_boxes = Box.all.map do |box|
      [].push(box.id).push(box.user_id)
    end
    existing_users_boxes.each do |users_box|
      UsersBox.create(box_id: users_box[0],
                      user_id: users_box[1],
                      write_access: true)
    end
  end

  def up
    copy_box_data
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
