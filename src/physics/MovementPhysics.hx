package physics;

import components.Sprite;

interface MovementPhysics {
    public function update(dt: Float, sprite: Sprite): Void;

    public function stop(): Void;
}

enum MovementType {
    Gravity(gravityAttached: Bool);
    Diagonal;
}

class MovementFactory {
    public static function create(type: MovementType): MovementPhysics {
        switch type {
            case Gravity(gravityAttached):
                return new GravityMovement(gravityAttached);
            case Diagonal:
                return new DiagonalMovement();    
        }
    }
}