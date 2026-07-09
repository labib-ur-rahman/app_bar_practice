import 'package:curved_app_bar/curved_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TaskItem {
  final String id;
  final String title;
  final String category;
  final String dueDate;
  final String priority; // 'Urgent', 'High', 'Medium', 'Low'
  bool isCompleted;

  TaskItem({
    required this.id,
    required this.title,
    required this.category,
    required this.dueDate,
    required this.priority,
    this.isCompleted = false,
  });
}

class TaskManagerScreen extends StatefulWidget {
  const TaskManagerScreen({super.key});

  @override
  State<TaskManagerScreen> createState() => _TaskManagerScreenState();
}

class _TaskManagerScreenState extends State<TaskManagerScreen> {
  final List<TaskItem> _tasks = [
    TaskItem(id: '1', title: 'Complete flutter app bar design', category: 'Work', dueDate: 'Today, 5:00 PM', priority: 'Urgent'),
    TaskItem(id: '2', title: 'Review team code pull request', category: 'Work', dueDate: 'Today, 6:30 PM', priority: 'High'),
    TaskItem(id: '3', title: 'Go to the fitness gym session', category: 'Wellness', dueDate: 'Tomorrow, 7:00 AM', priority: 'Medium'),
    TaskItem(id: '4', title: 'Buy weekly grocery items', category: 'Personal', dueDate: 'Jul 11, 4:00 PM', priority: 'Low'),
    TaskItem(id: '5', title: 'Prepare slides for tech demo', category: 'Work', dueDate: 'Jul 12, 10:00 AM', priority: 'High'),
    TaskItem(id: '6', title: 'Read 5 pages of Dart programming book', category: 'Study', dueDate: 'Jul 13, 9:00 PM', priority: 'Low'),
  ];

  void _toggleTask(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
  }

  void _clearCompleted() {
    setState(() {
      _tasks.removeWhere((t) => t.isCompleted);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cleared completed tasks')),
    );
  }

  void _markAllCompleted() {
    setState(() {
      for (var t in _tasks) {
        t.isCompleted = true;
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Marked all tasks as completed')),
    );
  }

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'Urgent':
        return Colors.redAccent;
      case 'High':
        return Colors.orangeAccent;
      case 'Medium':
        return Colors.blueAccent;
      case 'Low':
      default:
        return Colors.grey;
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Work':
        return Iconsax.briefcase;
      case 'Wellness':
        return Iconsax.activity;
      case 'Personal':
        return Iconsax.user;
      case 'Study':
        return Iconsax.book_1;
      default:
        return Iconsax.note_1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final completedCount = _tasks.where((t) => t.isCompleted).length;
    final totalCount = _tasks.length;
    final progress = totalCount > 0 ? completedCount / totalCount : 0.0;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB), // Modern light gray background
      appBar: CurvedAppBar(
        shape: CurvedAppBarShape.rounded,
        curveRadius: 32,
        backgroundColor: const Color(0xFF1E293B), // Slate 800
        foregroundColor: Colors.white,
        title: const Text(
          'Workspace Tasks',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        subtitle: Text(
          '$completedCount of $totalCount completed',
          style: const TextStyle(color: Colors.white70, fontSize: 13),
        ),
        maxVisibleActionItems: 2,
        overflowMenuColor: Colors.white,
        overflowMenuIconColor: const Color(0xFF1E293B),
        overflowMenuTextStyle: const TextStyle(
          color: Color(0xFF1E293B),
          fontWeight: FontWeight.w500,
        ),
        actionItems: [
          CurvedAppBarAction(
            label: 'Add Task',
            icon: Iconsax.add_circle,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Add task clicked')),
              );
            },
          ),
          CurvedAppBarAction(
            label: 'Refresh',
            icon: Iconsax.refresh,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tasks reloaded')),
              );
            },
          ),
          CurvedAppBarAction(
            label: 'Mark All Done',
            icon: Iconsax.tick_circle,
            onPressed: _markAllCompleted,
          ),
          CurvedAppBarAction(
            label: 'Clear Finished',
            icon: Iconsax.trash,
            menuIconColor: Colors.redAccent,
            menuTextStyle: const TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
            onPressed: _clearCompleted,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Completion Progress',
                      style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${(progress * 100).toInt()}%',
                      style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.white.withOpacity(0.15),
                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF10B981)),
                    minHeight: 6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: _tasks.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Iconsax.task,
                    size: 64,
                    color: Colors.blueGrey.shade200,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'All caught up!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'No active tasks remaining.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.02),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: InkWell(
                      onTap: () => _toggleTask(index),
                      borderRadius: BorderRadius.circular(30),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: task.isCompleted ? const Color(0xFF10B981) : Colors.grey.shade400,
                            width: 2,
                          ),
                          color: task.isCompleted ? const Color(0xFF10B981) : Colors.transparent,
                        ),
                        child: task.isCompleted
                            ? const Icon(Icons.check, size: 14, color: Colors.white)
                            : null,
                      ),
                    ),
                    title: Text(
                      task.title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: task.isCompleted ? Colors.grey[500] : const Color(0xFF1E293B),
                        decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          Icon(
                            _getCategoryIcon(task.category),
                            size: 14,
                            color: Colors.grey[500],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            task.category,
                            style: TextStyle(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 12),
                          Icon(
                            Iconsax.calendar,
                            size: 14,
                            color: Colors.grey[500],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            task.dueDate,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: _getPriorityColor(task.priority).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              task.priority,
                              style: TextStyle(
                                color: _getPriorityColor(task.priority),
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
