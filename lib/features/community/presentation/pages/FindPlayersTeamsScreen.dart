import 'package:flutter/material.dart';

class FindPlayersTeamsScreen extends StatefulWidget {
  const FindPlayersTeamsScreen({super.key});

  @override
  State<FindPlayersTeamsScreen> createState() => _FindPlayersTeamsScreenState();
}

class _FindPlayersTeamsScreenState extends State<FindPlayersTeamsScreen> {
  bool isPlayersTab = true; // التحكم في التبديل بين اللاعبين والفرق
  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    // الألوان المستوحاة من الشاشة الأولى
    const darkBg = Color(0xFF0A1124); 
    const neonGreen = Color(0xFF00E676);
    const cardBg = Color(0xFF16223F);

    return Scaffold(
      backgroundColor: darkBg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Find Players & Teams',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            
            // --- أزرار التبديل العلوي (Find Players / Find Teams) ---
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: cardBg,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildTabButton("Find Players", isPlayersTab, () {
                      setState(() => isPlayersTab = true);
                    }, neonGreen),
                  ),
                  Expanded(
                    child: _buildTabButton("Find Teams", !isPlayersTab, () {
                      setState(() => isPlayersTab = false);
                    }, neonGreen),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // --- حقل البحث وزر الفلترة الجانبي ---
            Row(
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: cardBg,
                      hintText: isPlayersTab ? 'Search players...' : 'Search teams...',
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: cardBg,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.tune, color: Colors.white),
                )
              ],
            ),
            const SizedBox(height: 16),

            // --- شريط الفلاتر السريعة (Horizontal Filters) ---
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: isPlayersTab 
                  ? [
                      _buildFilterChip('All Levels', selectedFilter == 'All', () => setState(() => selectedFilter = 'All'), neonGreen),
                      _buildFilterChip('Nearby', selectedFilter == 'Nearby', () => setState(() => selectedFilter = 'Nearby'), neonGreen),
                      _buildFilterChip('Available Now', selectedFilter == 'Available', () => setState(() => selectedFilter = 'Available'), neonGreen),
                    ]
                  : [
                      _buildFilterChip('All Sports', selectedFilter == 'AllS', () => setState(() => selectedFilter = 'AllS'), neonGreen),
                      _buildFilterChip('Needs Players', selectedFilter == 'Needs', () => setState(() => selectedFilter = 'Needs'), neonGreen),
                      _buildFilterChip('Top Rated', selectedFilter == 'Top', () => setState(() => selectedFilter = 'Top'), neonGreen),
                    ],
              ),
            ),
            const SizedBox(height: 16),

            // --- القائمة المتغيرة بناءً على التاب المختار ---
            Expanded(
              child: isPlayersTab 
                  ? _buildPlayersList(cardBg, neonGreen) 
                  : _buildTeamsList(cardBg, neonGreen),
            ),
          ],
        ),
      ),
    );
  }

  // ويدجيت مساعد لبناء أزرار التبديل العلوية
  Widget _buildTabButton(String title, bool isActive, VoidCallback onTap, Color activeColor) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? activeColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // ويدجيت مساعد لبناء الفلاتر الأفقية
  Widget _buildFilterChip(String label, bool isSelected, VoidCallback onTap, Color activeColor) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? activeColor : const Color(0xFF16223F),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
 
  
  }



  Widget _buildTeamsList(Color cardBg, Color neonGreen) {
  final teams = [
    {'name': 'Street Warriors', 'sport': 'Football', 'status': 'Ready', 'players': '5/5', 'stats': '12W - 3L', 'rate': '80%', 'rating': '4.7'},
    {'name': 'Court Kings', 'sport': 'Basketball', 'status': 'Needs Players', 'players': '4/5', 'stats': '8W - 4L', 'rate': '67%', 'rating': '4.5'},
  ];

  return ListView.builder(
    itemCount: teams.length,
    itemBuilder: (context, index) {
      final team = teams[index];
      final needsPlayers = team['status'] == 'Needs Players';

      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // أيقونة تمثل الفريق أو اللعبة
                Container(
                  width: 60, height: 60,
                  decoration: BoxDecoration(color: neonGreen.withOpacity(0.1), borderRadius: BorderRadius.circular(14)),
                  child: Icon(
                    team['sport'] == 'Football' ? Icons.sports_soccer : Icons.sports_basketball, 
                    color: neonGreen, size: 35
                  ),
                ),
                const SizedBox(width: 16),
                // تفاصيل الفريق
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(team['name']!, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(team['sport']!, style: const TextStyle(color: Colors.grey, fontSize: 14)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: needsPlayers ? Colors.orange.withOpacity(0.2) : neonGreen.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              team['status']!, 
                              style: TextStyle(color: needsPlayers ? Colors.orange : neonGreen, fontSize: 12, fontWeight: FontWeight.bold)
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Icon(Icons.people, color: Colors.grey, size: 16),
                          const SizedBox(width: 4),
                          Text(team['players']!, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
                // التقييم النجمي للشلة/الفريق
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(team['rating']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            // إحصائيات الفوز والخسارة المضافة بالأسفل بتصميم نيق
            Divider(color: Colors.white.withOpacity(0.1)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Stats: ${team['stats']}", style: const TextStyle(color: Colors.grey, fontSize: 13)),
                Text("Win Rate: ${team['rate']}", style: TextStyle(color: neonGreen, fontSize: 13, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),
            // أزرار التحكم السفلية لكارت الفريق
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white, side: BorderSide(color: Colors.white.withOpacity(0.2)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {},
                    child: const Text("View"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: needsPlayers ? neonGreen : Colors.redAccent,
                      foregroundColor: needsPlayers ? Colors.black : Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {},
                    child: Text(
                      needsPlayers ? "Join Team" : "Challenge", 
                      style: const TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
Widget _buildPlayersList(Color cardBg, Color neonGreen) {
  final players = [
    {'name': 'Marcus Silva', 'role': 'Forward', 'level': 'Advanced', 'dist': '1.2 km away', 'rating': '4.8', 'status': 'Available'},
    {'name': 'Alex Johnson', 'role': 'Midfielder', 'level': 'Intermediate', 'dist': '2.5 km away', 'rating': '4.6', 'status': 'Available'},
    {'name': 'Jordan Lee', 'role': 'Defender', 'level': 'Advanced', 'dist': '0.8 km away', 'rating': '4.9', 'status': 'Busy'},
  ];

  return ListView.builder(
    itemCount: players.length,
    itemBuilder: (context, index) {
      final player = players[index];
      final isAvailable = player['status'] == 'Available';

      return Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.05)), // لمسة Glassmorphism خفيفة
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // صورة اللاعب الدائرية مع مؤشر الحالة أونلاين
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[700],
                      child: const Icon(Icons.person, color: Colors.white24, size: 35),
                    ),
                    if (isAvailable)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            color: neonGreen,
                            shape: BoxShape.circle,
                            border: Border.all(color: cardBg, width: 2),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 16),
                // تفاصيل اللاعب
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(player['name']!, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(player['role']!, style: const TextStyle(color: Colors.grey, fontSize: 14)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFF9C27B0).withOpacity(0.2), // بنفسجي شفاف من الثيم السابق
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(player['level']!, style: const TextStyle(color: Color(0xFFBB86FC), fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(width: 8),
                          Icon(Icons.location_on, color: Colors.grey[400], size: 14),
                          const SizedBox(width: 4),
                          Text(player['dist']!, style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
                // التقييم النجمي
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(player['rating']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            // أزرار التحكم السفلية بالكارت
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white, side: BorderSide(color: Colors.white.withOpacity(0.2)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.visibility, size: 18),
                    label: const Text("View"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: neonGreen,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.person_add, size: 18),
                    label: const Text("Invite", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
}