import utils.CollisionSystem;
import components.SimpleCollider;
import objects.Square;
import objects.Ball;
import hxd.App;
import objects.GameObject;

class Main extends hxd.App {
	public static var objects:Array<GameObject> = [];

	var collisionSystem:CollisionSystem;

	override function init() {
		collisionSystem = new CollisionSystem();
		Square.create(s2d, 0, 200, false);
		Square.create(s2d, 0, 0, true);
		Ball.create(s2d, 700, 500, {dx: -2, dy: -2});
	}

	override function update(dt:Float) {
		collisionSystem.update(dt);
		for (obj in objects) {
			obj.update(dt);
		}
	}

	static function main() {
		new Main();
	}
}
