package utils;

import components.SimpleCollider;

class CollisionSystem {
	public static var colliders:Array<SimpleCollider> = [];

	public static function addCollider(collider:SimpleCollider) {
		colliders.push(collider);
	}

	public function new() {}

	public function update(dt:Float) {
		for (first_collider in colliders) {
			for (second_collider in colliders) {
				if (first_collider.attachee != second_collider.attachee
					&& CollisionUtils.inRange(first_collider.attachee, second_collider.attachee)) {
					first_collider.collidedWith(second_collider);
					second_collider.collidedWith(first_collider);
				}
			}
		}
	}
}
