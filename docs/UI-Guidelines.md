# UI Guidelines

Design system for Little Logic Lab. Prevents inconsistent UI. Align with Montessori-inspired calm—not loud “kids app” tropes.

## Principles

- Warm, minimal, soft
- Large touch targets
- Accessible by default
- Calm animations only
- One clear job per screen
- No manipulative visual urgency (flashing CTAs, countdown reds, badge spam)

## Typography

- Prefer expressive but readable fonts suitable for young children (high legibility, generous size)
- Avoid default generic stacks as the brand voice once the design system is chosen
- Clear hierarchy: activity title → short instruction → board
- Body and labels large enough for 3–7 year olds and parent glanceability
- Record the final font choices in `DECISIONS.md` when selected

## Spacing

- Generous whitespace; avoid dense dashboards
- Consistent spacing scale (e.g. 4 / 8 / 16 / 24 / 32 / 48)
- Separate instruction, play surface, and secondary actions clearly
- Prefer breathing room over packing multiple activities on one screen

## Icons

- Simple, concrete, recognizable
- Prefer illustration-quality symbols over noisy emoji clusters
- Icons support meaning; they do not decorate every surface
- Sufficient contrast and size for touch and low vision

## Colors

- Soft, warm palette (nature-inspired, Montessori materials feel)
- Limited primary accents; avoid purple-glow / high-stimulation defaults
- Strong contrast for interactive elements and text
- Error / incorrect states: gentle, non-shaming (soft cue, not alarm)
- Success: calm affirmation, not fireworks overload
- Document exact tokens in code (`ColorScheme` / theme) and keep this file in sync

## Animation rules

- Purposeful, short, calm (presence and hierarchy—not noise)
- Prefer subtle transitions for placement, focus, and feedback
- No rapid looping attention-hijacks
- Respect reduced-motion accessibility settings
- Ship a small set of intentional motions rather than many competing ones

## Touch targets

- Minimum ~48×48 dp (prefer larger for ages 3–7)
- Adequate spacing between tappable pieces
- Drag targets forgiving; snap gently when helpful
- Primary actions easy to hit with a finger, not a mouse cursor mindset

## Accessibility

- Dynamic type / scalable text where feasible
- Screen reader labels for controls and key board states
- Color never the only signal (shape/position/pattern too)
- Sufficient contrast
- Reduced motion support
- Parent-accessible settings for comfort (e.g. sound soft on/off)

## Montessori inspiration

- Materials feel tangible and orderly
- Child-led pace; no forced paths beyond gentle curriculum unlocks
- Beauty through simplicity and natural order
- Environment supports concentration
- Adult (parent) tools are quiet and secondary—not the hero of the child’s screen

## Layout anti-patterns (do not)

- Card-heavy dashboards in the child’s primary play flow
- Stat strips, streak banners, coin counters
- Floating promo badges on the play surface
- Tiny hit areas or crowded piece trays
