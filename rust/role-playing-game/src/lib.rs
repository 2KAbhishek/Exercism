// This stub file contains items that aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

pub struct Player {
    pub health: u32,
    pub mana: Option<u32>,
    pub level: u32,
}

impl Player {
    pub fn revive(&self) -> Option<Player> {
        if self.health == 0 {
            return Some(Player {
                health: 100,
                mana: if self.level >= 10 { Some(100) } else { None },
                level: self.level,
            });
        }
        None
    }

    pub fn cast_spell(&mut self, mana_cost: u32) -> u32 {
        if self.mana.is_none() {
            self.health = self.health.saturating_sub(mana_cost);
            return 0;
        } else if self.mana.unwrap_or_default() < mana_cost {
            return 0;
        } else {
            self.mana = Some(self.mana.unwrap() - mana_cost);
            return mana_cost * 2;
        }
    }
}
