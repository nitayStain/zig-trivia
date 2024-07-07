const std = @import("std");
const Allocator = std.mem.Allocator;

pub fn Vector(comptime T: type) type {
    return struct {
        pos: usize,
        items: []T,
        allocator: Allocator,

        fn init(allocator: Allocator) !Vector(T) {
            return .{
                .pos = 0,
                .allocator = allocator,
                .items = try allocator.alloc(T, 4),
            };
        }

        fn deinit(self: Vector(T)) void {
            self.allocator.free(self.items);
        }

        fn push_back(self: *Vector(T), value: T) !void {
            const pos = self.pos;
            const len = self.items.len;
            if (pos == len) {
                var larger = try self.allocator.alloc(T, len * 2);
                @memcpy(larger[0..len], self.items);

                self.allocator.free(self.items);
                self.items = larger;
            }

            self.items[pos] = value;
            self.pos += 1;
        }
    };
}
