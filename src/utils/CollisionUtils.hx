package utils;

import objects.GameObject;
import components.Sprite;

class CollisionUtils {
    public static function inRange(first_object: GameObject, second_object: GameObject) {
        // trace('Equal ${first_object == second_object}');
        var first_sprite = cast(first_object.getComponent("sprite"), Sprite);
        var second_sprite = cast(second_object.getComponent("sprite"), Sprite);
        // trace(first_sprite == second_sprite);
        return intersects(first_sprite, second_sprite);
    }

    public static function intersects(first_sprite: Sprite, second_sprite: Sprite) {
        var first_sprite_min_max_x = getMinMaxPos(first_sprite, X);
        var first_sprite_min_max_y = getMinMaxPos(first_sprite, Y);
        // trace(first_sprite_min_max_y);
        var second_sprite_min_max_x = getMinMaxPos(second_sprite, X);
        var second_sprite_min_max_y = getMinMaxPos(second_sprite, Y);
        // trace(second_sprite_min_max_y);
        return inRangeIntersect(first_sprite_min_max_x.min, first_sprite_min_max_x.max,
                                second_sprite_min_max_x.min, second_sprite_min_max_x.max) 
                && inRangeIntersect(first_sprite_min_max_y.min, first_sprite_min_max_y.max,
                                    second_sprite_min_max_y.min, second_sprite_min_max_y.max);
    }

    private static function inRangeIntersect(min0: Int, max0: Int, min1: Int, max1: Int) {
        return max0 >= min1 && min0 <= max1;
    }

    private static function getMinMaxPos(obj: Sprite, direction: CartesianDirection): MinMaxPos {
        return switch(direction) {
            case X: 
                {min: Std.int(obj.bitmap.x), max: Std.int(obj.bitmap.tile.width) + Std.int(obj.bitmap.x)}
            case Y:
                {min: Std.int(obj.bitmap.y), max: Std.int(obj.bitmap.tile.height) + Std.int(obj.bitmap.y)}    
        }
    }
}

typedef MinMaxPos = {
    min: Int,
    max: Int
}

enum CartesianDirection {
    X;
    Y;
}