package physics;

import physics.DiagonalMovement.InitialDirection;
import components.Sprite;

interface MovementPhysics {
    public function update(dt: Float, sprite: Sprite): Void;

    public function stop(): Void;

    public function invertMovement(): Void;
}

enum MovementType<T> {
    Gravity(gravityAttached: Bool);
    Diagonal(initialDirection: InitialDirection<T>);
}

class MovementFactory {
    public static function create<T>(type: MovementType<T>): MovementPhysics {
        switch type {
            case Gravity(gravityAttached):
                return new GravityMovement(gravityAttached);
            case Diagonal(initialDirection):
                return new DiagonalMovement(initialDirection);    
        }
    }
}