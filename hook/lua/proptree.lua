do
    local oldTreeGroup = TreeGroup
    local oldOnCollision = oldTreeGroup.OnCollision

    TreeGroup = Class(oldTreeGroup) {
        OnCollision = function(self, other, vec)
            if not EntityCategoryContains(categories.ENGINEER * categories.TECH1, other) then
                -- Only break if the collision isn't with a T1 engineer
                -- This means that the old OnCollision method isn't called at all if we do collide with a T1 engineer
                oldOnCollision(self, other, vec)
            end
        end,
    }
end